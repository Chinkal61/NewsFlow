//
//  NewsViewModel.swift
//  NewsFlow
//
//  Created by Chinkal on 17/04/26.
//

import Foundation
import Combine


@MainActor
class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let service = NewsService()
    
    func fetchNews() {
        Task {
            isLoading = true
            errorMessage = nil
            
            do {
                self.articles = try await service.fetchTopHeadlines()
            } catch {
                self.errorMessage = "Failed to load news: \(error.localizedDescription)"
            }
            
            isLoading = false
        }
    }
    
    func formattedDate(from dateString: String) -> String {
        guard let date = DateFormatter.iso8601.date(from: dateString) else {
            return dateString
        }
        
        return date.formatted(date: .abbreviated, time: .omitted)
    }
}
