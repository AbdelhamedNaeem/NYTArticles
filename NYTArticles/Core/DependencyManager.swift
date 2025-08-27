//
//  DependencyManager.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 27/08/2025.
//

import SwiftUI

enum DependencyManager {
    
    @MainActor
    static func createArticleListView() -> some View {
        let networking = ArticleNetwork()
        let repository = ArticleRepoImplementation(network: networking)
        let useCase = ArticleUseCase(repo: repository)
        let viewModel = ArticleListViewModel(articleUseCases: useCase)
        return ArticleListView(viewModel: viewModel)
    }
    
    @MainActor
    static func createArticleDetailsView(article: ArticleEntity) -> some View {
        return ArticleDetailsView(article: article)
    }
}
