
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
    
    init() {
        self.primary = ButtonStyle(
            font: .avenir(weight: .regular),
            fontSize: 18,
            fontColor: .green,
            backgroundColor: .clear,
            borderColor: .green,
            borderWidth: 2,
            borderCornerRadius: 8
        )
    }
}
