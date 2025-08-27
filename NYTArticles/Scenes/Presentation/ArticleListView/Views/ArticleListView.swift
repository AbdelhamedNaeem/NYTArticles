//
//  ArticleListView.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 26/08/2025.
//

import SwiftUI

struct ArticleListView: View {
    @ObservedObject var viewModel: ArticleListViewModel
    
    init(viewModel: ArticleListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Custom Navigation Bar
                HeaderNavigationView()
                    .padding(.bottom, 8)
                
                // Content
                if viewModel.isLoading {
                    loadingView
                } else if let errorMessage = viewModel.errorMessage {
                    errorView(message: errorMessage)
                } else {
                    articlesList
                }
            }
            .background(Color(.systemBackground))
            .navigationBarHidden(true)
        }
    }
    
    private var loadingView: some View {
        VStack {
            Spacer()
            ProgressView("Loading...")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Spacer()
        }
    }
    
    private func errorView(message: String) -> some View {
        VStack {
            Spacer()
            ErrorView(message: message) {
                viewModel.refreshArticles()
            }
            Spacer()
        }
    }
    
    private var articlesList: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.articles) { article in
                    VStack(spacing: 0) {
                        ArticleCellView(
                            title: article.title,
                            author: article.byline,
                            date: article.publishedDate,
                            desc: article.abstract,
                            imageURL: URL(string: article.firstMediaMeta?.url ?? "")
                        )
                        .onTapGesture {

                        }
                    }
                }
            }
        }
        .refreshable {
            viewModel.refreshArticles()
        }
    }
    
}
// MARK: - Preview

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(
            viewModel: ArticleListViewModel(
                articleUseCases: ArticleUseCase(
                    repo: ArticleRepoImplementation(
                        network: ArticleNetwork()
                    )
                )
            )
        )
    }
}
