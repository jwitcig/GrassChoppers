import UIKit

struct LightThemeTextStyles: TextStyles {
    
    let header: TextStyle
    let subheader: TextStyle
    let body: TextStyle
    
    init() {
        let textStyles = BaseTextStyles()
        
        self.header = textStyles.header.with(fontColor: .black)
        self.subheader = textStyles.subheader.with(fontColor: .black)
        self.body = textStyles.body.with(fontColor: .black)
    }
}

struct LightThemeColors: ThemeColors {
    let backgroundColor: UIColor = .white
    let actionText: UIColor = .black
    let bodyText: UIColor = .black
}

extension Theme {
    static let light = Theme(
        colors: LightThemeColors(),
        layout: StandardLayout(),
        textStyles: LightThemeTextStyles()
    )
}
