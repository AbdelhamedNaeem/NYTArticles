//
//  ArticleCellView.swift
//  NYTArticles
//
//  Created by Abdelhamid Naeem on 26/08/2025.
//

import SwiftUI

struct ArticleCellView: View {
    let title: String
    let author: String
    let date: String
    let desc: String
    let imageURL: URL?
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            // Circular image placeholder
            AsyncImageView(
                url: imageURL,
                size: CGSize(width: 60, height: 60)
            )
            
            // Article details
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 8)
                
                HStack(spacing: 4) {                    
                    Text(author)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
                
                HStack(spacing: 8) {
                    
                    Text(desc)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        Image(systemName: "calendar")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        
                        Text(date)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                }
                
            }
                        
            // Chevron
            Image(systemName: "chevron.right")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.leading, 8)
            
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color(.systemBackground))
    }
}

struct ArticleCellView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            ArticleCellView(
                title: "Supporters of the Democratic candidate Jon Ossoff after his race was called early Wednesday in Atlanta.",
                author: "DAVID LEONHARDT",
                date: "2017-06-23",
                desc: "ediumThreeByTwo440",
                imageURL: nil
            )
        }
        .previewLayout(.sizeThatFits)
    }
}
