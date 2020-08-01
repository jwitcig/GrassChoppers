import SnapKit
import UIKit

class HomeViewController: UIViewController {

    private let logicController: HomeLogicControlling
    
    private let label = UILabel()
    private let button = UIButton(type: .system)
    
    init(
        logicController: HomeLogicControlling
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
        view.backgroundColor = .white
        
        
        
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
        
        logicController.viewDidLoad()
    }
    
    @objc private func buttonPressed() {
        logicController.buttonPressed()
    }
}

extension HomeViewController: HomeLogicControllingDelegate {
    func update(name: String) {
        
        label.text = name
        
    }
}
