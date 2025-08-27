//
//  ArticleModel.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 27/08/2025.
//

import Foundation

struct ArticleModel: Codable {
    let status, copyright: String?
    let numResults: Int?
    let results: [ArticleData]?
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - ARTICLE
struct ArticleData: Codable, Identifiable {
    let id: Int
    let publishedDate: String
    let byline: String?
    let title, abstract: String?
    let media: [Media]?
    let url: String?
    let section: String?
    let subsection: String?
    
    enum CodingKeys: String, CodingKey {
        case id, byline, title, abstract, media, url, section, subsection
        case publishedDate = "published_date"
    }
}
// MARK: - Media
struct Media: Codable {
    let mediaMetadata: [MediaMetadata]?

    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadata: Codable {
    let url: String?
    let format: String?
}
