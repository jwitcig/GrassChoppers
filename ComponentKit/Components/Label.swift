import ThemeKit
import UIKit

public class Label: UILabel {
    
    public init(textStyle: TextStyle) {
        super.init(frame: .zero)
                
        set(textStyle: textStyle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(textStyle: TextStyle) {
        font = textStyle.font.font.withSize(textStyle.fontSize)
        textColor = textStyle.fontColor
    }
}
