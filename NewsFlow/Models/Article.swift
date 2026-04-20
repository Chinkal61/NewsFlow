//
//  Article.swift
//  NewsFlow
//
//  Created by Chinkal on 16/04/26.
//

import Foundation

struct Article: Codable {
    let source: Source
    let title: String
    let author: String?
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String
}
