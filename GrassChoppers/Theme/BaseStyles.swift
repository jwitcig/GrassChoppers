
struct BaseTextStyles: TextStyles {
    
    let header = TextStyle(
        font: .avenir(weight: .light),
        fontSize: 32,
        fontColor: .black
    )
    
    let subheader = TextStyle(
        font: .avenir(weight: .regular),
        fontSize: 24,
        fontColor: .black
    )
    
    let body = TextStyle(
        font: .avenir(weight: .regular),
        fontSize: 18,
        fontColor: .black
    )
}

struct BaseButtonStyles: ButtonStyles {
    
    let primary: ButtonStyle
    let secondary: ButtonStyle
    let floating: ButtonStyle

    init() {
        self.primary = ButtonStyle(
            font: .avenir(weight: .medium),
            fontSize: 18,
            fontColor: .black,
            backgroundColor: .green,
            borderColor: .green,
            borderWidth: 2,
            borderCornerRadius: 8
        )
        
        self.secondary = ButtonStyle(
            font: .avenir(weight: .medium),
            fontSize: 18,
            fontColor: .green,
            backgroundColor: .clear,
            borderColor: .green,
            borderWidth: 2,
            borderCornerRadius: 8
        )
        
        self.floating = ButtonStyle(
            font: .avenir(weight: .medium),
            fontSize: 18,
            fontColor: .green,
            backgroundColor: .clear,
            borderColor: .clear,
            borderWidth: 0,
            borderCornerRadius: 0
        )
    }
}

struct BaseTextFieldStyles: TextFieldStyles {
    
    let primary: TextFieldStyle

    init() {
        self.primary = TextFieldStyle(
            font: .avenir(weight: .medium),
            fontSize: 18,
            fontColor: .green,
            backgroundColor: .clear,
            borderColor: .green,
            borderWidth: 2,
            borderCornerRadius: 8,
            placeholderColor: .green,
            cursorColor: .green
        )
    }
}
