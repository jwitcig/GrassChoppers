protocol HomeLogicControlling: class {
    var delegate: HomeLogicControllingDelegate? { get set }
    
    func viewDidLoad()
    func buttonPressed()
}

protocol HomeLogicControllingDelegate: class {
    func update(name: String)
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
    
    func viewDidLoad() {
        
        dataManager.requestInitialState()
        
    }
    
    func buttonPressed() {
        router.routeToNextScreen()
    }
}

extension HomeLogicController: HomeDataManagingDelegate {
    func didFetch(name: String) {
        print("logic controller got the response: \(name)")
        
        delegate?.update(name: name)
    }
}
