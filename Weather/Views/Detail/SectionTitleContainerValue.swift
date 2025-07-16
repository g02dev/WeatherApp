import SwiftUI

extension ContainerValues {
    @Entry var sectionTitle: String?
}

extension View {
    func sectionTitle(_ title: String?) -> some View {
        containerValue(\.sectionTitle, title)
    }
}
