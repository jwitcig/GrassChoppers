import UIKit

private struct DarkThemeTextStyles: TextStyles {
    
    let header: TextStyle
    let subheader: TextStyle
    let body: TextStyle
    
    init() {
        let textStyles = BaseTextStyles()
        
        self.header = textStyles.header.with(fontColor: .white)
        self.subheader = textStyles.subheader.with(fontColor: .white)
        self.body = textStyles.body.with(fontColor: .white)
    }
}

private struct DarkThemeButtonStyles: ButtonStyles {
    
    let primary: ButtonStyle
    
    init() {
        let baseStyles = BaseButtonStyles()
        
        self.primary = baseStyles.primary
    }
}

private struct Colors: ThemeColors {
    let backgroundColor: UIColor = .black
}

extension Theme {
    static let dark = Theme(
        colors: Colors(),
        layout: StandardLayout(),
        textStyles: DarkThemeTextStyles(),
        buttonStyles: DarkThemeButtonStyles()
    )
}
