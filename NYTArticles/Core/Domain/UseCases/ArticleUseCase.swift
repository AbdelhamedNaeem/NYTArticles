//
//  ArticleUseCase.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 27/08/2025.
//

import Foundation
import Combine

protocol ArticleUseCaseProtocol {
    func fetchArticles() -> AnyPublisher<[ArticleEntity], RequestError>
}

// MARK: - ARTICLE USE CASES
final class ArticleUseCase: ArticleUseCaseProtocol {

    private let repo: ArticleRepository

    init(repo: ArticleRepository) {
        self.repo = repo
    }

    func fetchArticles() -> AnyPublisher<[ArticleEntity], RequestError> {
        repo.fetchArticles()                                  // AnyPublisher<ArticlesEntity, Error>
            .map { $0.results ?? [] }                         // [ArticleModel]
            .map { $0.map(ArticleEntity.init(from:)) }        // [ArticleEntity]
            .eraseToAnyPublisher()
    }
}
