import UIKit

struct LightThemeTextStyles: TextStyles {
    
    let header: TextStyle
    let subheader: TextStyle
    let body: TextStyle
    let action: TextStyle
    
    init() {
        let textStyles = BaseTextStyles()
        
        self.header = textStyles.header.with(fontColor: .black)
        self.subheader = textStyles.subheader.with(fontColor: .black)
        self.body = textStyles.body.with(fontColor: .black)
        self.action = textStyles.action
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
