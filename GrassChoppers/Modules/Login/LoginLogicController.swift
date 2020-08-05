protocol LoginLogicControlling: class {
    var delegate: LoginLogicControllingDelegate? { get set }
}

protocol LoginLogicControllingDelegate: class {
    
}

class LoginLogicController: LoginLogicControlling {
    
    private let dataManager: LoginDataManaging
    private let router: LoginRouting
    
    weak var delegate: LoginLogicControllingDelegate?
    
    init(
        dataManager: LoginDataManaging,
        router: LoginRouting
    ) {
        self.dataManager = dataManager
        self.router = router
        
        self.dataManager.delegate = self
    }
}

extension LoginLogicController: LoginDataManagingDelegate {
    
}
