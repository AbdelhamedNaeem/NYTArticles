//
//  ArticleNetwork.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 27/08/2025.
//

import Foundation
import Combine


// MARK: - ARTICLE Network Service
class ArticleNetwork:ArticleNetworkProtocol, HttpClient {
    func fetchArticles() -> AnyPublisher<ArticleModel, RequestError> {
        let apiKey = "5Cfn0bmhr8QISoa5qNN5pl91oe09wSgm"
        return self.performRequest(endPoint: ArticleEndPoints.mostViewed(apiKey: apiKey))
    }
}
