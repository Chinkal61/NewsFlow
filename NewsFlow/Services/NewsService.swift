//
//  NewsService.swift
//  NewsFlow
//
//  Created by Chinkal on 16/04/26.
//

import Foundation

struct NewsService {
    
    func fetchTopHeadlines() async throws -> [Article] {
                
        let endpoint = NewsEndpoint.topHeadlines
        
        guard let url = endpoint.baseURL else {
            throw NewsError.invalidURL
        }
        var components = URLComponents(url: url.appendingPathComponent(endpoint.path),
                                       resolvingAgainstBaseURL: false)
        
        components?.queryItems = endpoint.queryItems
        
        guard let finalURL = components?.url else {
            throw NewsError.invalidURL
        }
        
        var request = URLRequest(url: finalURL)
        
        request.httpMethod = endpoint.method.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NewsError.unknown
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NewsError.invalidResponse(httpResponse.statusCode)
        }
        
        do {
            let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
            return newsResponse.articles
        } catch {
            throw NewsError.decodingFailed
        }
    }
}
