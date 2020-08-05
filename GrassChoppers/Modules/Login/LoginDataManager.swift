protocol LoginDataManaging: class {
    var delegate: LoginDataManagingDelegate? { get set }
}

protocol LoginDataManagingDelegate: class {
    
}

class LoginDataManager: LoginDataManaging {
    
    weak var delegate: LoginDataManagingDelegate?
    
}
