protocol HomeLogicControlling: class {
    var delegate: HomeLogicControllingDelegate? { get set }
    
    func buttonPressed()
}

protocol HomeLogicControllingDelegate: class {
    
}

class HomeLogicController: HomeLogicControlling {
    
    private let dataManager: HomeDataManaging
    private let router: HomeRouting
    
    weak var delegate: HomeLogicControllingDelegate?
    
    init(
        dataManager: HomeDataManaging,
        router: HomeRouting
    ) {
        self.dataManager = dataManager
        self.router = router
        
        self.dataManager.delegate = self
    }
    
    func buttonPressed() {
        router.routeToNextScreen()
    }
}

extension HomeLogicController: HomeDataManagingDelegate {
    
}
