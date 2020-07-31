protocol LogicControlling: class {
    var delegate: LogicControllingDelegate? { get set }
}

protocol LogicControllingDelegate: class {
    
}

class LogicController: LogicControlling {
    
    private let dataManager: DataManaging
    private let router: Routing
    
    weak var delegate: LogicControllingDelegate?
    
    init(
        dataManager: DataManaging,
        router: Routing
    ) {
        self.dataManager = dataManager
        self.router = router
        
        self.dataManager.delegate = self
    }
}

extension LogicController: DataManagingDelegate {
    
}
