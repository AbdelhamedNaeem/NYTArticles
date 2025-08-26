import SwiftUI

struct AsyncImageView: View {
    let url: URL?
    let size: CGSize
    
    init(
        url: URL?,
        size: CGSize = CGSize(width: 60, height: 60)
    ) {
        self.url = url
        self.size = size
    }
    
    var body: some View {
        ZStack {
            // Background circle
            Circle()
                .fill(Color(.systemGray4))
                .frame(width: size.width, height: size.height)
            
            // Image or placeholder
            if let url = url {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .clipShape(Circle())
                    case .failure(_):
                        placeholderView
                    case .empty:
                        ProgressView()
                            .scaleEffect(0.5)
                    @unknown default:
                        placeholderView
                    }
                }
            } else {
                placeholderView
            }
        }
        .frame(width: size.width, height: size.height)
    }
    
    @ViewBuilder
    private var placeholderView: some View {
        Image(systemName: "photo")
            .font(.title3)
            .foregroundColor(.secondary)
    }
}

// MARK: - Preview

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            // Circle image with photo placeholder
            AsyncImageView(
                url: nil,
                size: CGSize(width: 60, height: 60)
            )
        }
        .padding()
    }
}
