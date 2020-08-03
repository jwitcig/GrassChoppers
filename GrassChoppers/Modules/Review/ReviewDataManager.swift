protocol ReviewDataManaging: class {
    var delegate: ReviewDataManagingDelegate? { get set }
    
    func requestInitialState()
}

protocol ReviewDataManagingDelegate: class {
    func didFetch(title: String, subtitle: String)
}

class ReviewDataManager: ReviewDataManaging {
    
    weak var delegate: ReviewDataManagingDelegate?
    
    func requestInitialState() {
        delegate?.didFetch(
            title: "How was our service?",
            subtitle: "Your feedback is appreciated and helps us know how to do better. Tap a star to rate your experience."
        )
    }
}
