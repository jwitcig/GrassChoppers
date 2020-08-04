import SnapKit
import UIKit

protocol PromptViewControlling {}

class PromptViewController: UIViewController, PromptViewControlling {

    internal let imageView = UIImageView()
    internal let titleLabel = UILabel()
    internal let subtitleLabel = UILabel()
    
    internal let acceptButton = UIButton()
    internal let dismissButton = UIButton()
    
    internal let logicController: PromptLogicControlling
    
    init(
        logicController: PromptLogicControlling
    ) {
        self.logicController = logicController
        
        super.init(nibName: nil, bundle: nil)
        
        self.logicController.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAppearance() {
        
    }
    
    private func setupConstraints() {
        
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
