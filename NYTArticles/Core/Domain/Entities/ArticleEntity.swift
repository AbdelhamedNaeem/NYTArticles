//
//  ArticleEntity.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 27/08/2025.
//

import Foundation

// MARK: - Domain (clean) entity for UI / business logic
struct ArticleEntity: Identifiable {
    let id: Int
    let title: String
    let abstract: String
    let byline: String
    let publishedDate: String
    let url: String
    let section: String
    let subsection: String
    let firstMediaMeta: MediaMetadata?   

    init(from model: ArticleData) {
        self.id = model.id
        self.title = model.title ?? ""
        self.abstract = model.abstract ?? ""
        self.byline = model.byline ?? ""
        self.publishedDate = model.publishedDate
        self.url = model.url ?? ""
        self.section = model.section ?? ""
        self.subsection = model.subsection ?? ""

        self.firstMediaMeta = model.media?.first?.mediaMetadata?.first { metadata in
            metadata.format == "mediumThreeByTwo440"
        }
    }
}
