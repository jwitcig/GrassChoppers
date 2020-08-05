import ThemeKit
import UIKit

public class Button: UIButton {
    
    public init(style: ButtonStyle) {
        super.init(frame: .zero)
        
        set(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(style: ButtonStyle) {
        setTitleColor(style.fontColor, for: .normal)
        titleLabel?.font = style.font.font.withSize(style.fontSize)
        backgroundColor = style.backgroundColor
        layer.borderWidth = style.borderWidth
        layer.borderColor = style.borderColor.cgColor
        layer.cornerRadius = style.borderCornerRadius
    }
}
