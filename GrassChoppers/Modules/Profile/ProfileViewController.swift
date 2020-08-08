import ComponentKit
import ThemeKit
import UIKit

class ProfileViewController: UIViewController {

    private let avatarImageView = UIImageView()
    private let nameLabel: Label
    private let phoneNumberLabel: Label
    private let emailLabel: Label
    private let addressLabel: Label

    private let planHeaderLabel: Label
    private let planStackView = UIStackView()
    private let scheduleLabel: Label
    private let priceLabel: Label

    private let logicController: ProfileLogicControlling
    
    private let theme: ThemeType
    
    init(
        logicController: ProfileLogicControlling,
        theme: ThemeType
    ) {
        self.logicController = logicController
        self.theme = theme
        self.nameLabel = Label(textStyle: theme.textStyles.header)
        self.emailLabel = Label(textStyle: theme.textStyles.body)
        self.phoneNumberLabel = Label(textStyle: theme.textStyles.body)
        self.addressLabel = Label(textStyle: theme.textStyles.body)
        
        self.planHeaderLabel = Label(textStyle: theme.textStyles.header)
        self.scheduleLabel = Label(textStyle: theme.textStyles.subheader)
        self.priceLabel = Label(textStyle: theme.textStyles.subheader)
        
        super.init(nibName: nil, bundle: nil)
        
        self.logicController.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        setupConstraints()
    }
    
    private func setupAppearance() {
        view.backgroundColor = theme.colors.backgroundColor
        
        avatarImageView.contentMode = .scaleAspectFit

        nameLabel.text = "Wasay Khan"
        nameLabel.textAlignment = .center
        
        phoneNumberLabel.text = "816.682.3618"
        phoneNumberLabel.textAlignment = .center
        
        emailLabel.text = "wasay.r.khan@gmail.com"
        emailLabel.textAlignment = .center
        
        addressLabel.text = "2645 Old 63 S Columbia, MO 65201"
        addressLabel.textAlignment = .center
        addressLabel.numberOfLines = 0
        
        scheduleLabel.text = "Biweekly"
        scheduleLabel.textAlignment = .center
        
        priceLabel.text = "$50"
        priceLabel.textAlignment = .center
        
        planHeaderLabel.addBottomBorder(withWidth: 1, color: planHeaderLabel.textColor)
        planHeaderLabel.text = "Plan"
        planHeaderLabel.textAlignment = .center
        
        planStackView.axis = .horizontal
        planStackView.alignment = .fill
        planStackView.distribution = .fillEqually
        planStackView.addArrangedSubview(scheduleLabel)
        planStackView.addArrangedSubview(priceLabel)
        
        view.addSubviews([
            avatarImageView,
            nameLabel,
            phoneNumberLabel,
            emailLabel,
            addressLabel,
            planHeaderLabel,
            planStackView,
        ])
    }
    
    private func setupConstraints() {
        avatarImageView.snp.makeConstraints { make in
            make.width.height.equalTo(120)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(60)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(avatarImageView.snp.bottom).offset(16)
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(16)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(emailLabel.snp.bottom).offset(16)
        }
        
        planHeaderLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.top.equalTo(addressLabel.snp.bottom).offset(72)
        }
        
        planStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(planHeaderLabel.snp.bottom).offset(16)
        }
    }
}

extension ProfileViewController: ProfileLogicControllingDelegate {
    
}

extension UIView {
    
    func addSubviews(_ subviews: [UIView]) {
        for view in subviews {
            self.addSubview(view)
        }
    }
    
    func addBottomBorder(withWidth width: CGFloat, color: UIColor) {
        let borderView = UIView()
        borderView.backgroundColor = color
        addSubview(borderView)
        borderView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(width)
        }
    }
}
