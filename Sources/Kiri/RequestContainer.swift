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
    associatedtype responseType
    var endpoint: String { get }
    var path: String { get }
    var httpMethod: Alamofire.HTTPMethod { get set }
    var parameters: Alamofire.Parameters? { get set }
    var encoding: Alamofire.URLEncoding { get set }
    func response(data: Data) throws -> responseType
}
