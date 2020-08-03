import Cosmos
import UIKit

class ReviewViewController: UIViewController {

    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let starsView = CosmosView()
    private let dismissButton = UIButton()
    private let textfield = UITextField()
    private let stackView = UIStackView()
    
    private let logicController: ReviewLogicControlling
    
    init(
        logicController: ReviewLogicControlling
    ) {
        self.logicController = logicController
        
        super.init(nibName: nil, bundle: nil)
        
        self.logicController.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "#228B22FF")
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        setupAppearance()
        setupConstraints()
        
        logicController.viewDidLoad()
    }
    
    private func setupAppearance() {
        let starsContainer = UIView()
        starsContainer.addSubview(starsView)
        
        let views = [
            imageView,
            titleLabel,
            subtitleLabel,
            starsContainer,
            textfield,
            dismissButton
        ]
        views.forEach(stackView.addArrangedSubview)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16
        view.addSubview(stackView)
        
        // image view
        imageView.image = #imageLiteral(resourceName: "mower")
        imageView.contentMode = .scaleAspectFit
        
        // title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Avenir-Heavy", size: 34)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        
        // subtitle
        subtitleLabel.font = UIFont(name: "Avenir", size: 18)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textColor = .white
        
        // stars
        starsView.settings.starSize = 30
        starsView.settings.fillMode = .full
        starsView.settings.filledColor = UIColor(hex: "#E2FAB5FF")!
        starsView.settings.filledBorderColor = UIColor(hex: "#E2FAB5FF")!
        starsView.settings.emptyBorderColor = .white
        starsView.settings.emptyBorderWidth = 2
        
        // textfield
        textfield.placeholder = "Leave a note"
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 4
        textfield.textAlignment = .center
        
        // dismiss button
        dismissButton.setTitle("Dismiss", for: .normal)
    }
    
    private func setupConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
        
        starsView.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.top.bottom.centerX.equalToSuperview()
        }
        
        textfield.snp.makeConstraints { make in
            make.height.equalTo(32)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
        
        stackView.setCustomSpacing(0, after: imageView)
        stackView.setCustomSpacing(16, after: subtitleLabel)
        stackView.setCustomSpacing(16, after: starsView)
    }
}

extension ReviewViewController: ReviewLogicControllingDelegate {
 
    func update(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
