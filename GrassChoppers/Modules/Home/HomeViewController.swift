import SnapKit
import UIKit

class HomeViewController: UIViewController {

    private let logicController: HomeLogicControlling
    
    private let label: Label
    private let button: Button
    
    private let theme: Theme
    
    init(
        logicController: HomeLogicControlling,
        theme: Theme
    ) {
        self.logicController = logicController
        self.label = Label(textStyle: theme.textStyles.header)
        self.button = Button(theme: theme)
        self.theme = theme
        
        super.init(nibName: nil, bundle: nil)
        
        self.logicController.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = theme.colors.backgroundColor
        
        view.addSubview(label)
        label.text = "Home"
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        view.addSubview(button)
        button.setTitle("press", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(label.snp.bottom)
        }
    }
    
    @objc private func buttonPressed() {
        logicController.buttonPressed()
    }
}

extension HomeViewController: HomeLogicControllingDelegate {
    
}
