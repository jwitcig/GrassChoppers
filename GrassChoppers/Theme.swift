import CoreGraphics
import UIKit

protocol ThemeColors {
    var backgroundColor: UIColor { get }
}

protocol ThemeLayout {
    var defaultSpacing: CGFloat { get }
    var smallSpacing: CGFloat { get }
    var thinSpacing: CGFloat { get }
}

//struct Theme<Colors: ThemeColors, Layout: ThemeLayout> {
//    let colors: Colors
//    let layout: Layout
//}

// --------------------------------------------------------------------

struct Themes {
//    private static let dark = Theme(colors: DarkThemeColors(), layout: RegularLayout())
    
    struct Colors {
        static let dark = ThemeColors(backgroundColor: .black)
    }
}

struct ThemeColors {
    let backgroundColor: UIColor = .black
}

struct Layout: ThemeLayout {
    let defaultSpacing: CGFloat = 16
    let smallSpacing: CGFloat = 8
    let thinSpacing: CGFloat = 4
}
