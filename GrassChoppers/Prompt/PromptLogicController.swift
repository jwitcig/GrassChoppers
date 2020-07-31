protocol PromptLogicControlling: class {
    var delegate: PromptLogicControllingDelegate? { get set }
}

protocol PromptLogicControllingDelegate: class {
    
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
}

extension PromptLogicController: PromptDataManagingDelegate {
    
}
