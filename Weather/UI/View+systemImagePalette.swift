import SwiftUI

extension View {
    func systemImagePalette(_ palette: SystemImagePalette) -> some View {
        modifier(SystemImagePaletteModifier(systemImagePalette: palette))
    }
}

private struct SystemImagePaletteModifier: ViewModifier {
    let systemImagePalette: SystemImagePalette

    func body(content: Content) -> some View {
        content
            .symbolRenderingMode(.palette)
            .foregroundStyle(
                systemImagePalette.primary,
                systemImagePalette.secondary,
                systemImagePalette.tertiary
            )
    }
}
