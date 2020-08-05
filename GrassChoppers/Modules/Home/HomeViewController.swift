import SnapKit
import ThemeKit
import UIKit

class HomeViewController: UIViewController {

    private let logicController: HomeLogicControlling
    
    private let label: Label
    private let button: Button
    
    private let theme: ThemeType
    
    init(
        logicController: HomeLogicControlling,
        theme: ThemeType
    ) {
        self.logicController = logicController
        self.label = Label(textStyle: theme.textStyles.header)
        self.button = Button(style: theme.buttonStyles.secondary)
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
            $0.width.equalTo(80)
        }
        
        let textField = TextField(style: theme.textFieldStyles.primary)
        textField.placeholder = "some text here"
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview().multipliedBy(1.5)
            make.height.equalTo(44)
        }
    }
    
    @objc private func buttonPressed() {
        logicController.buttonPressed()
    }
}

extension HomeViewController: HomeLogicControllingDelegate {
    
}
