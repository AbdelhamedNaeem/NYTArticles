//
//  ArticleListView.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 26/08/2025.
//

import SwiftUI

struct ArticleListView: View {
    @StateObject private var viewModel = ArticleListViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Custom Navigation Bar
                HeaderNavigationView()
                    .padding(.bottom, 8)
                
                // Content
                if viewModel.isLoading {
                    loadingView
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
    
    private var articlesList: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.articles) { article in
                    VStack(spacing: 0) {
                        ArticleCellView(
                            title: article.title,
                            author: article.author,
                            date: article.date,
                            desc: article.description,
                            imageURL: article.imageURL
                        )
                        .onTapGesture {

                        }
                    }
                }
            }
        }
    }
    
}
// MARK: - Preview

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
