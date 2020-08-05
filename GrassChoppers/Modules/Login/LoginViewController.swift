import UIKit

class LoginViewController: UIViewController {

    private let logicController: LoginLogicControlling
    
    private let theme: ThemeType
    
    init(
        logicController: LoginLogicControlling,
        theme: ThemeType
    ) {
        self.logicController = logicController
        self.theme = theme
        
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
    }
    
    private func setupConstraints() {
        
    }
}

extension LoginViewController: LoginLogicControllingDelegate {
    
}
