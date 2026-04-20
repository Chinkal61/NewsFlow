//
//  NewsEndpoint.swift
//  NewsFlow
//
//  Created by Chinkal on 17/04/26.
//

import Foundation

enum NewsEndpoint: Endpoint {
    
    case topHeadlines
    
    var path: String {
        switch self {
        case .topHeadlines:
            return "/v2/top-headlines"
        }
        
    }
    var method: HTTPMethod {
        switch self {
        case .topHeadlines:
            return .get
        }
    }
    var queryItems: [URLQueryItem] {
        switch self {
        case .topHeadlines:
            return [
                URLQueryItem(name: "country", value: "us"),
                URLQueryItem(name: "apiKey", value: Constants.API.newsAPIKey)
            ]
        }
    }
}
