protocol ReviewDataManaging: class {
    var delegate: ReviewDataManagingDelegate? { get set }
}

protocol ReviewDataManagingDelegate: class {
    
}

class ReviewDataManager: ReviewDataManaging {
    
    weak var delegate: ReviewDataManagingDelegate?
    
}
