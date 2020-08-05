import SnapKit
import UIKit

protocol PromptViewControlling {}

class PromptViewController: UIViewController, PromptViewControlling {

    internal let imageView = UIImageView()
    internal let titleLabel: Label
    internal let subtitleLabel: Label
    
    internal let acceptButton: Button
    internal let dismissButton: Button
    
    internal let logicController: PromptLogicControlling
    
    internal let theme: ThemeType
    
    init(
        logicController: PromptLogicControlling,
        theme: ThemeType
    ) {
        self.logicController = logicController
        self.theme = theme
        self.titleLabel = Label(textStyle: theme.textStyles.header)
        self.subtitleLabel = Label(textStyle: theme.textStyles.subheader)
        self.acceptButton = Button(style: theme.buttonStyles.primary)
        self.dismissButton = Button(style: theme.buttonStyles.floating)
        
        super.init(nibName: nil, bundle: nil)
        
        self.logicController.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setupAppearance() {
        view.backgroundColor = theme.colors.backgroundColor
    }
    
    internal func setupConstraints() {
        
    }
}

extension PromptViewController: PromptLogicControllingDelegate {
    
    @objc func update(title: String, subtitle: String?) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
    
    func update(image: UIImage?) {
        imageView.image = image
    }
}
