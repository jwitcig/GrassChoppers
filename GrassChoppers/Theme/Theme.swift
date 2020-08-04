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

protocol ThemeType {
    var colors: ThemeColors { get }
    var layout: ThemeLayout { get }
    var textStyles: TextStyles { get }
}

struct TextStyle {
    let font: FontSelection
    let fontSize: CGFloat
    let fontColor: UIColor
    
    func with(fontColor: UIColor) -> TextStyle {
        return TextStyle(font: font, fontSize: fontSize, fontColor: fontColor)
    }
}

protocol FontWeightType {
    var `extension`: String { get }
}

extension FontWeightType where Self: RawRepresentable, RawValue == String {
    var `extension`: String {
        return rawValue
    }
}

protocol TextStyles {
    var body: TextStyle { get }
    var header: TextStyle { get }
    var subheader: TextStyle { get }
    var action: TextStyle { get }
}

struct Theme: ThemeType {
    let colors: ThemeColors
    let layout: ThemeLayout
    let textStyles: TextStyles
    
    init(
        colors: ThemeColors = LightThemeColors(),
        layout: ThemeLayout = StandardLayout(),
        textStyles: TextStyles = LightThemeTextStyles()
    ) {
        self.colors = colors
        self.layout = layout
        self.textStyles = textStyles
    }
}

struct StandardLayout: ThemeLayout {
    let defaultSpacing: CGFloat = 16
    let smallSpacing: CGFloat = 8
    let thinSpacing: CGFloat = 4
}

extension RawRepresentable where RawValue == String {
    var stringValue: String {
        return rawValue
    }
}
