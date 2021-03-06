import Swinject

protocol Routing: class {
    var viewController: UIViewController? { get set }
}

class Router {
    
    private let resolver: Resolver
    
    weak var viewController: UIViewController?
    
    init(
        resolver: Resolver
    ) {
        self.resolver = resolver
    }
}
