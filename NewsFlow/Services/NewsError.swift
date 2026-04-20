//
//  NewsError.swift
//  NewsFlow
//
//  Created by Chinkal on 16/04/26.
//

import Foundation

enum NewsError: Error {
    case invalidURL
    case invalidResponse(Int)
    case decodingFailed
    case unknown
}
