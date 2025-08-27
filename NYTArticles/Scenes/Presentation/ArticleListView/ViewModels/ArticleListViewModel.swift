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
    @Published var articles: [ArticleEntity] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let articleUseCases: ArticleUseCaseProtocol
    
    // Dependency injection via initializer
    init(articleUseCases: ArticleUseCaseProtocol) {
        self.articleUseCases = articleUseCases
        fetchArticles()
    }
    
    func fetchArticles() {
        isLoading = true
        errorMessage = nil
        
        articleUseCases.fetchArticles()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    
                    switch completion {
                    case .finished:
                        // Successfully completed
                        break
                    case .failure(let error):
                        // Handle different error cases
                        self?.handleError(error)
                    }
                },
                receiveValue: { [weak self] articleEntities in
                    self?.articles = articleEntities
                }
            )
            .store(in: &cancellables)
    }
    
    func refreshArticles() {
        fetchArticles()
    }
    
    private func handleError(_ error: RequestError) {
        errorMessage = RequestError.handle(error)
    }
}
