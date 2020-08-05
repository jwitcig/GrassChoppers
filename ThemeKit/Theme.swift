import CoreGraphics
import UIKit

public protocol ThemeColors {
    var backgroundColor: UIColor { get }
    var noticeBackgroundColor: UIColor { get }
}

public protocol ThemeLayout {
    var defaultSpacing: CGFloat { get }
    var smallSpacing: CGFloat { get }
    var thinSpacing: CGFloat { get }
}

public protocol ThemeType {
    var colors: ThemeColors { get }
    var layout: ThemeLayout { get }
    var textStyles: TextStyles { get }
    var textFieldStyles: TextFieldStyles { get }
    var buttonStyles: ButtonStyles { get }
}

public struct TextStyle {
    public let font: FontSelection
    public let fontSize: CGFloat
    public let fontColor: UIColor
    
    public init(font: FontSelection, fontSize: CGFloat, fontColor: UIColor) {
        self.font = font
        self.fontSize = fontSize
        self.fontColor = fontColor
    }
    
    public func with(fontColor: UIColor) -> TextStyle {
        return TextStyle(font: font, fontSize: fontSize, fontColor: fontColor)
    }
}

public struct ButtonStyle {
    public let font: FontSelection
    public let fontSize: CGFloat
    public let fontColor: UIColor
    public let backgroundColor: UIColor
    public let borderColor: UIColor
    public let borderWidth: CGFloat
    public let borderCornerRadius: CGFloat
    
    public init(
        font: FontSelection,
        fontSize: CGFloat,
        fontColor: UIColor,
        backgroundColor: UIColor,
        borderColor: UIColor,
        borderWidth: CGFloat,
        borderCornerRadius: CGFloat
    ) {
        self.font = font
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.borderCornerRadius = borderCornerRadius
    }
    
    public func with(
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

public struct TextFieldStyle {
    public let font: FontSelection
    public let fontSize: CGFloat
    public let fontColor: UIColor
    public let backgroundColor: UIColor
    public let borderColor: UIColor
    public let borderWidth: CGFloat
    public let borderCornerRadius: CGFloat
    public let placeholderColor: UIColor
    public let cursorColor: UIColor
    
    public init(
        font: FontSelection,
        fontSize: CGFloat,
        fontColor: UIColor,
        backgroundColor: UIColor,
        borderColor: UIColor,
        borderWidth: CGFloat,
        borderCornerRadius: CGFloat,
        placeholderColor: UIColor,
        cursorColor: UIColor
    ) {
        self.font = font
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.borderCornerRadius = borderCornerRadius
        self.placeholderColor = placeholderColor
        self.cursorColor = cursorColor
    }
    
    public func with(
        fontColor: UIColor? = nil,
        backgroundColor: UIColor? = nil
    ) -> TextFieldStyle {
        return TextFieldStyle(
            font: font,
            fontSize: fontSize,
            fontColor: fontColor ?? self.fontColor,
            backgroundColor: backgroundColor ?? self.backgroundColor,
            borderColor: borderColor,
            borderWidth: borderWidth,
            borderCornerRadius: borderCornerRadius,
            placeholderColor: placeholderColor,
            cursorColor: cursorColor
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

public protocol TextStyles {
    var body: TextStyle { get }
    var header: TextStyle { get }
    var subheader: TextStyle { get }
}

public protocol ButtonStyles {
    var primary: ButtonStyle { get }
    var secondary: ButtonStyle { get }
    var floating: ButtonStyle { get }
}

public protocol TextFieldStyles {
    var primary: TextFieldStyle { get }
}

public struct Theme: ThemeType {
    public let colors: ThemeColors
    public let layout: ThemeLayout
    public let textStyles: TextStyles
    public let textFieldStyles: TextFieldStyles
    public let buttonStyles: ButtonStyles

    public init(
        colors: ThemeColors,
        layout: ThemeLayout,
        textStyles: TextStyles,
        textFieldStyles: TextFieldStyles,
        buttonStyles: ButtonStyles
    ) {
        self.colors = colors
        self.layout = layout
        self.textStyles = textStyles
        self.textFieldStyles = textFieldStyles
        self.buttonStyles = buttonStyles
    }
}

public struct StandardLayout: ThemeLayout {
    public let defaultSpacing: CGFloat
    public let smallSpacing: CGFloat
    public let thinSpacing: CGFloat
    
    public init(
        defaultSpacing: CGFloat = 16,
        smallSpacing: CGFloat = 8,
        thinSpacing: CGFloat = 4
    ) {
        self.defaultSpacing = defaultSpacing
        self.smallSpacing = smallSpacing
        self.thinSpacing = thinSpacing
    }
}

extension RawRepresentable where RawValue == String {
    var stringValue: String {
        return rawValue
    }
}

