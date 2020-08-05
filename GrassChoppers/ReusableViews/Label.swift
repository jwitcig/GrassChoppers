import UIKit

class Label: UILabel {
    
    init(textStyle: TextStyle) {
        super.init(frame: .zero)
                
        set(textStyle: textStyle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(textStyle: TextStyle) {
        font = textStyle.font.font.withSize(textStyle.fontSize)
        textColor = textStyle.fontColor
    }
}

class Button: UIButton {
    
    init(style: ButtonStyle) {
        super.init(frame: .zero)
        
        setTitleColor(style.fontColor, for: .normal)
        titleLabel?.font = style.font.font.withSize(style.fontSize)
        backgroundColor = style.backgroundColor
        layer.borderWidth = style.borderWidth
        layer.borderColor = style.borderColor.cgColor
        layer.cornerRadius = style.borderCornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
