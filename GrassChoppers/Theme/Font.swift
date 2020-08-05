import UIKit

enum FontSelection {
    case avenir(weight: AvenirFontWeight)
    
    var font: UIFont {
        switch self {
        case .avenir(let weight):
            return UIFont(name: "Avenir-\(weight.extension)")!
        }
    }
}

private extension UIFont {
    convenience init?(name: String) {
        self.init(name: name, size: 12)
    }
}

enum AvenirFontWeight: String, FontWeightType {
    case light = "Light"
    case regular = "Book"
    case medium = "Medium"
    case heavy = "Heavy"
    case bold = "Black"
}
