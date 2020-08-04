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
    
    init(theme: Theme) {
        super.init(frame: .zero)
        
        setTitleColor(theme.colors.actionText, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
