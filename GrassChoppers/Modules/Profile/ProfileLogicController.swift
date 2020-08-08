protocol ProfileLogicControlling: class {
    var delegate: ProfileLogicControllingDelegate? { get set }
}

protocol ProfileLogicControllingDelegate: class {
    
}

class ProfileLogicController: ProfileLogicControlling {
    
    private let dataManager: ProfileDataManaging
    private let router: ProfileRouting
    
    weak var delegate: ProfileLogicControllingDelegate?
    
    init(
        dataManager: ProfileDataManaging,
        router: ProfileRouting
    ) {
        self.dataManager = dataManager
        self.router = router
        
        self.dataManager.delegate = self
    }
}

extension ProfileLogicController: ProfileDataManagingDelegate {
    
}
