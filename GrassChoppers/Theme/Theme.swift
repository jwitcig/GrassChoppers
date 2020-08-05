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
    var buttonStyles: ButtonStyles { get }
}

struct TextStyle {
    let font: FontSelection
    let fontSize: CGFloat
    let fontColor: UIColor
    
    func with(fontColor: UIColor) -> TextStyle {
        return TextStyle(font: font, fontSize: fontSize, fontColor: fontColor)
    }
}

struct ButtonStyle {
    let font: FontSelection
    let fontSize: CGFloat
    let fontColor: UIColor
    let backgroundColor: UIColor
    let borderColor: UIColor
    let borderWidth: CGFloat
    let borderCornerRadius: CGFloat
    
    func with(
        fontColor: UIColor? = nil,
        backgroundColor: UIColor? = nil
    ) -> ButtonStyle {
        return ButtonStyle(
            font: font,
            fontSize: fontSize,
            fontColor: fontColor ?? self.fontColor,
            backgroundColor: backgroundColor ?? self.backgroundColor,
            borderColor: borderColor,
            borderWidth: borderWidth,
            borderCornerRadius: borderCornerRadius
        )
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
}

protocol ButtonStyles {
    var primary: ButtonStyle { get }
}

struct Theme: ThemeType {
    let colors: ThemeColors
    let layout: ThemeLayout
    let textStyles: TextStyles
    let buttonStyles: ButtonStyles
    
    init(
        colors: ThemeColors = LightThemeColors(),
        layout: ThemeLayout = StandardLayout(),
        textStyles: TextStyles = LightThemeTextStyles(),
        buttonStyles: ButtonStyles = LightThemeButtonStyles()
    ) {
        self.colors = colors
        self.layout = layout
        self.textStyles = textStyles
        self.buttonStyles = buttonStyles
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
