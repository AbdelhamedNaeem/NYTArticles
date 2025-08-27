//
//  ArticleDetailsView.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 26/08/2025.
//

import SwiftUI

struct ArticleDetailsView: View {
    let article: ArticleEntity
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header Image
                if let imageURL = URL(string: article.firstMediaMeta?.url ?? "") {
                    HStack {
                        Spacer()
                        AsyncImageView(
                            url: imageURL,
                            size: CGSize(width: 200, height: 200)
                        )
                        .cornerRadius(12)
                        Spacer()
                    }
                }
                
                // Title
                Text(article.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .lineLimit(nil)
                
                // Author and Date
                HStack {
                    Text(article.byline)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text(formatDate(article.publishedDate))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                // Abstract
                Text(article.abstract)
                    .font(.body)
                    .foregroundColor(.primary)
                    .lineLimit(nil)
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .navigationTitle("Article")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func formatDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if let date = formatter.date(from: dateString) {
            formatter.dateStyle = .medium
            return formatter.string(from: date)
        }
        
        return dateString
    }
}

#Preview {
    let sampleArticleData = ArticleData(
        id: 1,
        publishedDate: "2025-08-27",
        byline: "By John Doe",
        title: "Sample Article Title",
        abstract: "This is a sample abstract for the article that provides a brief overview of the content.",
        media: nil,
        url: "https://example.com",
        section: "Technology",
        subsection: "AI"
    )
    
    ArticleDetailsView(article: ArticleEntity(from: sampleArticleData))
}
