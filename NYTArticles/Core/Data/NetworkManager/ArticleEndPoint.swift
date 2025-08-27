//
//  ArticleEndPoints.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 27/08/2025.
//

import Foundation

enum ArticleEndPoints {
    case mostViewed(apiKey: String)
}

extension ArticleEndPoints: EndPoint {
    
    var path: String {
        switch self {
        case .mostViewed:
            return "mostpopular/v2/mostviewed/all-sections/7.json"
        }
    }
    
    var method: RequestMethod {
        return .get
    }
    
    var header: [String: String]? {
        nil
    }
    
    /// Optional query items for API key
    var queryItems: [URLQueryItem]? {
        switch self {
        case .mostViewed(let apiKey):
            return [
                URLQueryItem(name: "api-key", value: apiKey)
            ]
        }
    }
}
