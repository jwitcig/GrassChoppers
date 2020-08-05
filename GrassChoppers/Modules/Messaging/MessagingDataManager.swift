protocol MessagingDataManaging: class {
    var delegate: MessagingDataManagingDelegate? { get set }
}

protocol MessagingDataManagingDelegate: class {
    
}

class MessagingDataManager: MessagingDataManaging {
    
    weak var delegate: MessagingDataManagingDelegate?
    
}
