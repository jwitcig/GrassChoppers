import UIKit

struct LightThemeTextStyles: TextStyles {
    
    let header: TextStyle
    let subheader: TextStyle
    let body: TextStyle
    
    init() {
        let baseStyles = BaseTextStyles()
        
        self.header = baseStyles.header.with(fontColor: .black)
        self.subheader = baseStyles.subheader.with(fontColor: .black)
        self.body = baseStyles.body.with(fontColor: .black)
    }
}

struct LightThemeButtonStyles: ButtonStyles {
    
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

struct LightThemeColors: ThemeColors {
    let backgroundColor: UIColor = .white
}

extension Theme {
    static let light = Theme(
        colors: LightThemeColors(),
        layout: StandardLayout(),
        textStyles: LightThemeTextStyles()
    )
}
