protocol ReviewLogicControlling: class {
    var delegate: ReviewLogicControllingDelegate? { get set }
}

protocol ReviewLogicControllingDelegate: class {
    
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
}

extension ReviewLogicController: ReviewDataManagingDelegate {
    
}
