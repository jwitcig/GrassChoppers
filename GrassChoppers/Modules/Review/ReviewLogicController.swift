protocol ReviewLogicControlling: class {
    var delegate: ReviewLogicControllingDelegate? { get set }
    
    func viewDidLoad()
}

protocol ReviewLogicControllingDelegate: class {
    func update(title: String, subtitle: String)
}

class ReviewLogicController: ReviewLogicControlling {
    
    private let dataManager: ReviewDataManaging
    private let router: ReviewRouting
    
    weak var delegate: ReviewLogicControllingDelegate?
    
    init(
        dataManager: ReviewDataManaging,
        router: ReviewRouting
    ) {
        self.dataManager = dataManager
        self.router = router
        
        self.dataManager.delegate = self
    }
    
    func viewDidLoad() {
        dataManager.requestInitialState()
    }
}

extension ReviewLogicController: ReviewDataManagingDelegate {
    
    func didFetch(title: String, subtitle: String) {
        delegate?.update(title: title, subtitle: subtitle)
    }
}
