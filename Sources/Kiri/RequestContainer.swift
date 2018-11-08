//
//  RequestContainer.swift
//  Kiri
//
//  Created by Yusuke Ohashi on 2018/10/14.
//  Copyright © 2018 Yusuke Ohashi. All rights reserved.
//

import Foundation
import Alamofire

public protocol RequestContainer {
    var endpoint: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var parameters: Parameters? { get }
    var encoding: URLEncoding { get }
    var mockResponse: Response { get }
}
