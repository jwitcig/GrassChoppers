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
    let secondary: ButtonStyle
    let floating: ButtonStyle

    init() {
        let baseStyles = BaseButtonStyles()
        
        self.primary = baseStyles.primary
        self.secondary = baseStyles.secondary
        self.floating = baseStyles.floating
    }
}

private struct Colors: ThemeColors {
    let backgroundColor: UIColor = .black
    let noticeBackgroundColor: UIColor = .green
}

extension Theme {
    static let dark = Theme(
        colors: Colors(),
        layout: StandardLayout(),
        textStyles: DarkThemeTextStyles(),
        buttonStyles: DarkThemeButtonStyles()
    )
}
