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
    
    public func send(completion: @escaping (T.responseType?, Error?) -> Void) {
        guard let url = URL(string: request.endpoint + request.path) else {
            return
        }
        
        Alamofire.request(url,
                          method: request.httpMethod,
                          parameters: request.parameters,
                          encoding: request.encoding,
                          headers: nil)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        let response = try self.request.response(data: data)
                        completion(response, nil)
                    } catch {
                        completion(nil, error)
                    }
                case .failure(let error):
                    completion(nil, error)
                }
        }
    }
}
