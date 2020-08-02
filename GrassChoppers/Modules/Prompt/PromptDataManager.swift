protocol PromptDataManaging: class {
    var delegate: PromptDataManagingDelegate? { get set }
}

protocol PromptDataManagingDelegate: class {
    
}

class PromptDataManager: PromptDataManaging {
    
    weak var delegate: PromptDataManagingDelegate?
    
}
