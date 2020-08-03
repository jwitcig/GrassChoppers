import UIKit

protocol PromptLogicControlling: class {
    var delegate: PromptLogicControllingDelegate? { get set }
    
    func viewDidLoad()
}

protocol PromptLogicControllingDelegate: class {
    func update(title: String, subtitle: String?)
    func update(image: UIImage?)
}

class PromptLogicController: PromptLogicControlling {
    
    private let dataManager: PromptDataManaging
    private let router: PromptRouting
    
    weak var delegate: PromptLogicControllingDelegate?
    
    init(
        dataManager: PromptDataManaging,
        router: PromptRouting
    ) {
        self.dataManager = dataManager
        self.router = router
        
        self.dataManager.delegate = self
    }
    
    func viewDidLoad() {
        dataManager.requestInitialState()
    }
}

extension PromptLogicController: PromptDataManagingDelegate {
    
    func didFetch(title: String, subtitle: String?) {
        delegate?.update(title: title, subtitle: subtitle)
    }
    
    func didFetch(image: UIImage?) {
        delegate?.update(image: image)
    }
}
