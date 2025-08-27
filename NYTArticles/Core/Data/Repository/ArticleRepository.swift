//
//  MostPopularRepository.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 27/08/2025.
//

import Foundation
import Combine

// MARK: - ARTICLE REPO Implementation
final class ArticleRepoImplementation: ArticleRepository {
    
    let network: ArticleNetwork
    
    init(network: ArticleNetwork) {
        self.network = network
    }
    
    func fetchArticles() -> AnyPublisher<ArticleModel, RequestError> {
        return network.fetchArticles()
    }
}
