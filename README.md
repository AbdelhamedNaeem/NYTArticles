# NYT Articles iOS App

A modern iOS application that fetches and displays New York Times articles using Swift, SwiftUI, and Combine. Built with clean architecture principles and comprehensive unit testing.

## 🏗️ Architecture

### **Object-Oriented Programming Approach**
- **Protocol-Oriented Design**: Uses Swift protocols for dependency injection and testability
- **Clean Architecture**: Separation of concerns with Domain, Data, and Presentation layers
- **MVVM Pattern**: Model-View-ViewModel architecture with SwiftUI
- **Dependency Injection**: Centralized dependency management for better testability

### **Project Structure**
```
NYTArticles/
├── App/                           # App entry point
│   ├── NYTArticlesApp.swift      # Main app file
│   └── ContentView.swift         # Root view
├── Core/                         # Business logic layer
│   ├── Domain/                   # Domain entities and use cases
│   │   ├── Entities/
│   │   │   └── ArticleEntity.swift
│   │   ├── Repositories+Contract/
│   │   │   └── ArticleRepository+Contract.swift
│   │   └── UseCases/
│   │       └── ArticleUseCase.swift
│   ├── Data/                     # Data layer
│   │   ├── Models/
│   │   │   └── ArticleModel.swift
│   │   ├── NetworkManager/
│   │   │   ├── ArticleEndPoint.swift
│   │   │   ├── ArticleNetwork.swift
│   │   │   └── ArticleNetwork+Contract.swift
│   │   └── Repository/
│   │       └── ArticleRepository.swift
│   └── DependencyManager.swift   # Dependency injection
├── Scenes/                       # Presentation layer
│   └── Presentation/
│       ├── ArticleListView/      # Article list screen
│       │   ├── ViewModels/
│       │   │   └── ArticleListViewModel.swift
│       │   └── Views/
│       │       ├── ArticleListView.swift
│       │       ├── ArticleCellView.swift
│       │       └── HeaderNavigationView.swift
│       └── ArticleDetailsView/   # Article details screen
│           └── ArticleDetailsView.swift
└── Utilities/                    # Shared utilities
    ├── CustomViews/
    │   ├── AsyncImageView.swift
    │   └── ErrorView.swift
    └── Network/
        ├── HttpClient.swift
        ├── HttpEndPoint.swift
        └── NetworkConstant.swift
```

## 🚀 Features

- **Article List**: Display NYT articles with thumbnails and metadata
- **Article Details**: View full article details with navigation
- **Error Handling**: Comprehensive error states and user feedback
- **Loading States**: Smooth loading indicators
- **Modern UI**: Clean, responsive design following Apple's Human Interface Guidelines
- **Offline Support**: Graceful handling of network issues

## 🛠️ Requirements

- **Xcode**: 15.0 or later
- **iOS**: 18.0 or later
- **Swift**: 5.9 or later
- **macOS**: 14.0 or later (for development)

## 📱 Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/NYTArticles.git
cd NYTArticles
```

### 2. Open in Xcode
```bash
open NYTArticles.xcodeproj
```

### 3. Build and Run
- Select your target device or simulator
- Press `Cmd + R` to build and run
- Or use Product → Run from the menu

## 🧪 Testing

### **Unit Tests**
The project includes comprehensive unit tests for the business logic layer.

#### **Running Unit Tests**
```bash
# Run all tests
xcodebuild test -project NYTArticles.xcodeproj -scheme NYTArticles -destination 'platform=iOS Simulator,name=iPhone 16'

# Run specific test class
xcodebuild test -project NYTArticles.xcodeproj -scheme NYTArticles -destination 'platform=iOS Simulator,name=iPhone 16' -only-testing:NYTArticlesTests/ArticleUseCaseTests
```

#### **Test Structure**
```
NYTArticlesTests/
├── ArticleUseCaseTests.swift     # UseCase unit tests
└── MockArticleRepository.swift   # Mock for testing
```

#### **Test Coverage**
The project includes unit tests for:
- **ArticleUseCase**: Business logic testing
- **Data Transformation**: ArticleData → ArticleEntity mapping
- **Error Handling**: Empty data scenarios
- **Mock Repository**: Isolated testing without network dependencies

### **Generating Test Coverage Reports**

#### **Method 1: Using Xcode**
1. Open the project in Xcode
2. Go to Product → Scheme → Edit Scheme
3. Select "Test" from the left sidebar
4. Check "Code Coverage" option
5. Run tests (Cmd + U)
6. View coverage in Report Navigator

#### **Method 2: Using Command Line**
```bash
# Generate coverage report
xcodebuild test -project NYTArticles.xcodeproj -scheme NYTArticles -destination 'platform=iOS Simulator,name=iPhone 16' -enableCodeCoverage YES

# Coverage data will be available in:
# ~/Library/Developer/Xcode/DerivedData/NYTArticles-*/Build/Products/Debug-iphonesimulator/NYTArticles.app/PlugIns/NYTArticlesTests.xctest/
```

#### **Method 3: Using xcrun**
```bash
# Generate HTML coverage report
xcrun xccov view --report --html /path/to/coverage.xcresult > coverage.html
```

## 🏛️ Architecture Details

### **Clean Architecture Layers**

#### **Domain Layer**
- **Entities**: Pure business objects (`ArticleEntity`)
- **Use Cases**: Business logic (`ArticleUseCase`)
- **Repository Contracts**: Interfaces for data access

#### **Data Layer**
- **Models**: API response models (`ArticleModel`)
- **Repository Implementation**: Data access logic
- **Network Layer**: HTTP client and endpoints

#### **Presentation Layer**
- **ViewModels**: State management (`ArticleListViewModel`)
- **Views**: SwiftUI views
- **Dependency Injection**: Centralized dependency management

### **Design Patterns Used**

1. **MVVM**: Model-View-ViewModel for UI architecture
2. **Repository Pattern**: Abstract data access layer
3. **Dependency Injection**: For testability and loose coupling
4. **Protocol-Oriented Programming**: Swift's preferred approach
5. **Combine**: Reactive programming for async operations

## 🔧 Best Practices Implemented

### **Code Quality**
- **SwiftLint**: Code style enforcement (if configured)
- **Protocol-Oriented Design**: Using protocols over inheritance
- **Value Types**: Preferring structs over classes where appropriate
- **Error Handling**: Comprehensive error types and handling

### **Testing**
- **Unit Tests**: Isolated testing of business logic
- **Mock Objects**: Dependency isolation for testing
- **Test Coverage**: Aiming for high coverage of business logic
- **AAA Pattern**: Arrange, Act, Assert in test structure

### **Performance**
- **Lazy Loading**: Images loaded asynchronously
- **Memory Management**: Proper use of weak references
- **Background Processing**: Network calls on background queues

## 📊 Code Coverage

Current test coverage focuses on:
- **ArticleUseCase**: 100% coverage of business logic
- **Data Transformation**: Complete coverage of mapping logic
- **Error Scenarios**: Coverage of edge cases

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- New York Times API for providing article data
- Apple for SwiftUI and Combine frameworks
- The iOS development community for best practices and patterns

---

**Note**: This project is for educational and demonstration purposes. Please respect the New York Times API terms of service when using this code.