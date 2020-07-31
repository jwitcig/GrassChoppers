protocol HomeDataManaging: class {
    var delegate: HomeDataManagingDelegate? { get set }
}

protocol HomeDataManagingDelegate: class {
    
}

class HomeDataManager: HomeDataManaging {
    
    weak var delegate: HomeDataManagingDelegate?
    
}
