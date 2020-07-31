protocol HomeLogicControlling: class {
    var delegate: HomeLogicControllingDelegate? { get set }
}

protocol HomeLogicControllingDelegate: class {
    
}

class HomeLogicController: LogicControlling {
    
    private let dataManager: HomeDataManaging
    private let router: HomeRouting
    
    weak var delegate: LogicControllingDelegate?
    
    init(
        dataManager: HomeDataManaging,
        router: HomeRouting
    ) {
        self.dataManager = dataManager
        self.router = router
        
        self.dataManager.delegate = self
    }
}

extension HomeLogicController: HomeDataManagingDelegate {
    
}
