import XCTest
import Combine
@testable import NYTArticles

@MainActor
final class ArticleUseCaseTests: XCTestCase {
    
    // MARK: - Properties
    private var useCase: ArticleUseCase!
    private var mockRepository: MockArticleRepository!
    private var cancellables: Set<AnyCancellable>!
    
    // MARK: - Setup & Teardown
    override func setUp() {
        super.setUp()
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        useCase = nil
        mockRepository = nil
        cancellables = nil
        super.tearDown()
    }
    
    // MARK: - Test Cases - Focus on UseCase Logic Only
    
    func testUseCase_TransformsArticleDataToEntity() {
        // Given - Mock data that simulates what repository would return
        let mockArticles = MockArticleRepository.createMockArticles()
        mockRepository = MockArticleRepository(mockArticles: mockArticles)
        useCase = ArticleUseCase(repo: mockRepository)
        
        // When - Call UseCase (tests the transformation logic)
        var receivedEntities: [ArticleEntity] = []
        
        useCase.fetchArticles()
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { entities in
                    receivedEntities = entities
                }
            )
            .store(in: &cancellables)
        
        // Then - Verify transformation logic worked correctly
        XCTAssertEqual(receivedEntities.count, 2, "Should transform 2 articles")
        XCTAssertEqual(receivedEntities[0].title, "Test Article 1", "Title should be transformed correctly")
        XCTAssertEqual(receivedEntities[0].byline, "By Test Author 1", "Byline should be transformed correctly")
        XCTAssertEqual(receivedEntities[1].title, "Test Article 2", "Second article should be transformed correctly")
    }
    
    func testUseCase_HandlesEmptyData() {
        // Given - Empty data
        mockRepository = MockArticleRepository(mockArticles: [])
        useCase = ArticleUseCase(repo: mockRepository)
        
        // When - Call UseCase
        var receivedEntities: [ArticleEntity] = []
        
        useCase.fetchArticles()
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { entities in
                    receivedEntities = entities
                }
            )
            .store(in: &cancellables)
        
        // Then - Verify empty array handling
        XCTAssertTrue(receivedEntities.isEmpty, "Should return empty array when no data")
    }
    

}
