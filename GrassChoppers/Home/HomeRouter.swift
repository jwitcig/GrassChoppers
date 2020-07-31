import Swinject

protocol HomeRouting {
    var viewController: UIViewController? { get set }
}

class HomeRouter {
    
    private let resolver: Resolver
    
    weak var viewController: UIViewController?
    
    init(
        resolver: Resolver
    ) {
        self.resolver = resolver
    }
}
