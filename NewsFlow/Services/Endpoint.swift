//
//  Endpoint.swift
//  NewsFlow
//
//  Created by Chinkal on 16/04/26.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    var baseURL: URL? {
        return URL(string: Constants.API.baseURL)
    }
}
