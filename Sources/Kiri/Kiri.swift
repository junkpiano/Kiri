//
//  Kiri.swift
//  Kiri
//
//  Created by Yusuke Ohashi on 2018/10/14.
//  Copyright © 2018 Yusuke Ohashi. All rights reserved.
//

import Foundation
import Alamofire

public class Kiri<T: RequestContainer> {
    let request: T
    
    public init(request: T) {
        self.request = request
    }
    
    public func send(completion: @escaping (Response?, Error?) -> Void) {
        guard let url = URL(string: request.endpoint + request.path) else {
            return
        }
        
        Alamofire.request(url,
                          method: request.httpMethod,
                          parameters: request.parameters,
                          encoding: request.encoding,
                          headers: request.headers)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    let response = Response(data: data, response: response.response)
                    completion(response, nil)
                case .failure(let error):
                    completion(nil, error)
                }
        }
    }
}
