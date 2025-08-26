import SwiftUI

struct HeaderNavigationView: View {
    
    var body: some View {
        HStack(spacing: 16) {
            // Menu button
            Button(action: {
                // TODO: Implement menu
            }) {
                Image(systemName: "line.horizontal.3")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            
            // Title
            Text("NY Times Most Popular")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.white)
            
            Spacer()
            
            // Search button
            Button(action: {
                // TODO: Implement search
            }) {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundColor(.white)
            }
            
            // More options button
            Button(action: {
                // TODO: Implement more options
            }) {
                Image(systemName: "ellipsis")
                    .font(.title3)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(90))
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color(red: 0.2, green: 0.8, blue: 0.7)) // Teal/turquoise color
        .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
    }
}

struct HeaderNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderNavigationView()
            .previewLayout(.sizeThatFits)
    }
}
