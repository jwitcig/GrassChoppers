protocol DataManaging: class {
    var delegate: DataManagingDelegate? { get set }
}

protocol DataManagingDelegate: class {
    
}

class DataManager: DataManaging {
    
    weak var delegate: DataManagingDelegate?
    
}
