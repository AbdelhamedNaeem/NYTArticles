import Foundation
import Combine
@testable import NYTArticles

class MockArticleRepository: ArticleRepository {
    
    // MARK: - Test Properties
    private let mockArticles: [ArticleData]
    
    // MARK: - Initialization
    init(mockArticles: [ArticleData] = []) {
        self.mockArticles = mockArticles
    }
    
    // MARK: - Repository Implementation
    func fetchArticles() -> AnyPublisher<ArticleModel, RequestError> {
        let articleModel = ArticleModel(
            status: "OK",
            copyright: "Test Copyright",
            numResults: mockArticles.count,
            results: mockArticles
        )
        
        return Just(articleModel)
            .setFailureType(to: RequestError.self)
            .eraseToAnyPublisher()
    }
    
    // MARK: - Helper Methods
    
    static func createMockArticles() -> [ArticleData] {
        return [
            ArticleData(
                id: 1,
                publishedDate: "2025-08-27",
                byline: "By Test Author 1",
                title: "Test Article 1",
                abstract: "Test abstract 1",
                media: nil,
                url: "https://test1.com",
                section: "Test Section",
                subsection: "Test Subsection"
            ),
            ArticleData(
                id: 2,
                publishedDate: "2025-08-26",
                byline: "By Test Author 2",
                title: "Test Article 2",
                abstract: "Test abstract 2",
                media: nil,
                url: "https://test2.com",
                section: "Test Section",
                subsection: "Test Subsection"
            )
        ]
    }
}
