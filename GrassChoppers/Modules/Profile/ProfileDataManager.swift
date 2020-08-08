protocol ProfileDataManaging: class {
    var delegate: ProfileDataManagingDelegate? { get set }
}

protocol ProfileDataManagingDelegate: class {
    
}

class ProfileDataManager: ProfileDataManaging {
    
    weak var delegate: ProfileDataManagingDelegate?
    
}
