import Swinject

protocol ReviewRouting: class {
    var viewController: UIViewController? { get set }
}

class ReviewRouter: ReviewRouting {
    
    private let resolver: Resolver
    
    weak var viewController: UIViewController?
    
    init(
        resolver: Resolver
    ) {
        self.resolver = resolver
    }
}
