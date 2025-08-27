//
//  ContentView.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 26/08/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        DependencyManager.createArticleListView()
    }
}

#Preview {
    ContentView()
}
