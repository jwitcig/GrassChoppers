protocol ListDataManaging: class {
    var delegate: ListDataManagingDelegate? { get set }
}

protocol ListDataManagingDelegate: class {
    
}

class ListDataManager: ListDataManaging {
    
    weak var delegate: ListDataManagingDelegate?
    
}
