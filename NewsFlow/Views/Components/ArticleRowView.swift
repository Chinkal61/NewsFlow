//
//  ArticleRowView.swift
//  NewsFlow
//
//  Created by Chinkal on 17/04/26.
//

import SwiftUI

struct ArticleRowView: View {
    let article: Article
    let formattedDate: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            imageProvider(for: article.urlToImage)
                .frame(width: 100, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                
                Text(article.source.name)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                                
                HStack {
                    Text(formattedDate)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundStyle(.blue)
                }
            }
        }
        .padding(.vertical, 8)
    }
    
    @ViewBuilder
    private func imageProvider(for urlString: String?) -> some View {
        if let urlString = urlString, let url = URL(string: urlString) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .overlay(ProgressView())
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure:
                    placeholderImage
                @unknown default:
                    placeholderImage
                }
            }
        } else {
            placeholderImage
        }
    }
        
    private var placeholderImage: some View {
        ZStack {
            Color.gray.opacity(0.1)
            Image(systemName: "newspaper")
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ArticleRowView(article: Article(source: Source(id: "", name: "Name"), title: "Title", author: "Autor", description: "Disc", url: "Url", urlToImage: "Url", publishedAt: "str", content: "Str"), formattedDate: "15 Dec 2026")
}
