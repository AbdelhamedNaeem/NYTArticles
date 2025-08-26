//
//  ArticleListViewModel.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 27/08/2025.
//

import SwiftUI
import Combine

@MainActor
class ArticleListViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchArticles()
    }
    
    func fetchArticles() {
        isLoading = true
        errorMessage = nil
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.loadMockData()
            self.isLoading = false
        }
    }
    
    func refreshArticles() {
        fetchArticles()
    }
    
    private func loadMockData() {
        articles = [
            Article(
                id: "1",
                title: "Supporters of the Democratic candidate Jon Ossoff after his race was called early Wednesday in Atlanta.",
                author: "DAVID LEONHARDT",
                date: "2017-06-23",
                description: "ediumThreeByTwo440",
                imageURL: nil
            ),
            Article(
                id: "2",
                title: "The latest developments in technology and their impact on society.",
                author: "JANE SMITH",
                date: "2017-06-22",
                description: "ediumThreeByTwo440",
                imageURL: nil
            ),
            Article(
                id: "3",
                title: "Economic trends and market analysis for the upcoming quarter.",
                author: "MICHAEL JOHNSON",
                date: "2017-06-21",
                description: "ediumThreeByTwo440",
                imageURL: nil
            )
        ]
    }
}

// MARK: - Article Model

struct Article: Identifiable, Hashable {
    let id: String
    let title: String
    let author: String
    let date: String
    let description: String
    let imageURL: URL?
    
}
