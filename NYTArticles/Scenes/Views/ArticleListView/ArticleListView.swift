import SwiftUI

struct ArticleListView: View {
    @State private var showMenu = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Custom Navigation Bar
                HeaderNavigationView()
                    .padding(.bottom,8)
                
                // Content
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(0..<10, id: \.self) { index in
                            VStack(spacing: 0) {
                                ArticleCellView(
                                    title: "Supporters of the Democratic candidate Jon Ossoff after his race was called early Wednesday in Atlanta.",
                                    author: "DAVID LEONHARDT",
                                    date: "2017-06-23",
                                    desc: "ediumThreeByTwo440",
                                    imageURL: nil
                                )
                            }
                        }
                    }
                }
            }
            .background(Color(.systemBackground))
            .navigationBarHidden(true)
        }
    }
    
}
// MARK: - Preview

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
