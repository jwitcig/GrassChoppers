protocol MessagingLogicControlling: class {
    var delegate: MessagingLogicControllingDelegate? { get set }
}

protocol MessagingLogicControllingDelegate: class {
    
}

class MessagingLogicController: MessagingLogicControlling {
    
    private let dataManager: MessagingDataManaging
    private let router: MessagingRouting
    
    weak var delegate: MessagingLogicControllingDelegate?
    
    init(
        dataManager: MessagingDataManaging,
        router: MessagingRouting
    ) {
        self.dataManager = dataManager
        self.router = router
        
        self.dataManager.delegate = self
    }
}

extension MessagingLogicController: MessagingDataManagingDelegate {
    
}
