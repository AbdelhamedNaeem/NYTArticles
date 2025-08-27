//
//  ContentView.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 26/08/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ArticleListViewModel(
        articleUseCases: ArticleUseCase(
            repo: ArticleRepoImplementation(
                network: ArticleNetwork()
            )
        )
    )
    
    var body: some View {
        ArticleListView(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
}
