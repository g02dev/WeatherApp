import SwiftUI

struct SystemImagePalette {
    let primary: Color
    let secondary: Color
    let tertiary: Color
    
    init (primary: Color, secondary: Color = .clear, tertiary: Color = .clear) {
        self.primary = primary
        self.secondary = secondary
        self.tertiary = tertiary
    }
}
