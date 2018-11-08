//
//  KiriResponse.swift
//  Kiri
//
//  Created by Yusuke Ohashi on 2018/11/07.
//  Copyright © 2018 Yusuke Ohashi. All rights reserved.
//

import Foundation

public class Response {
    public let data: Data
    public let response: HTTPURLResponse?
    public let request: RequestContainer

    public init(data: Data, response: HTTPURLResponse?, request: RequestContainer) {
        self.data = data
        self.response = response
        self.request = request
    }
}

extension Response {
    public func decodeJSON<T: Decodable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: self.data)
    }

    public func plainText() -> String {
        return String(data: self.data, encoding: String.Encoding.utf8) ?? ""
    }
}
