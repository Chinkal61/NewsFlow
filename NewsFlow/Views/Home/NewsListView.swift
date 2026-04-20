//
//  ContentView.swift
//  NewsFlow
//
//  Created by Chinkal on 16/04/26.
//

import SwiftUI

struct NewsListView: View {
    
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading headlines...")
                } else if let errorMessage = viewModel.errorMessage {
                    ErrorView(message: errorMessage, onRetry: viewModel.fetchNews)
                } else {
                    List(viewModel.articles, id: \.url) { article in
                        ArticleRowView(
                            article: article,
                            formattedDate: viewModel.formattedDate(from: article.publishedAt)
                        )
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Top Headlines")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                viewModel.fetchNews()
            }
        }
    }
}

#Preview {
    NewsListView()
}
