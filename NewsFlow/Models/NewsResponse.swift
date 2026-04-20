//
//  NewsResponse.swift
//  NewsFlow
//
//  Created by Chinkal on 16/04/26.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
