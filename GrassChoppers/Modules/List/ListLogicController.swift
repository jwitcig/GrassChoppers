protocol ListLogicControlling: class {
    var delegate: ListLogicControllingDelegate? { get set }
}

protocol ListLogicControllingDelegate: class {
    
}

class ListLogicController: ListLogicControlling {
    
    private let dataManager: ListDataManaging
    private let router: ListRouting
    
    weak var delegate: ListLogicControllingDelegate?
    
    init(
        dataManager: ListDataManaging,
        router: ListRouting
    ) {
        self.dataManager = dataManager
        self.router = router
        
        self.dataManager.delegate = self
    }
}

extension ListLogicController: ListDataManagingDelegate {
    
}
