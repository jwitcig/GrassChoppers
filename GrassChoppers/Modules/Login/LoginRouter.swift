import Swinject

protocol LoginRouting: class {
    var viewController: UIViewController? { get set }
}

class LoginRouter {
    
    private let resolver: Resolver
    
    weak var viewController: UIViewController?
    
    init(
        resolver: Resolver
    ) {
        self.resolver = resolver
    }
}
