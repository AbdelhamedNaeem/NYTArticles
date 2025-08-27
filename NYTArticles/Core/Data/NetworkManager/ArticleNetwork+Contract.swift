//
//  ArticleNetwork+Contract.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 27/08/2025.
//

import Foundation
import Combine

protocol ArticleNetworkProtocol {
    func fetchArticles() -> AnyPublisher<ArticleModel, RequestError>
}
