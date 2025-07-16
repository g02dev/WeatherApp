import SwiftUI

struct LocationDetailsContainer<Content: View>: View {
    @ViewBuilder var content: Content

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(subviews: content) { subview in
                if let title = subview.containerValues.sectionTitle {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                subview
            }
        }
    }
}
