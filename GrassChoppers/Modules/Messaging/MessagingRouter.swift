import Swinject

protocol MessagingRouting: class {
    var viewController: UIViewController? { get set }
}

class MessagingRouter {
    
    private let resolver: Resolver
    
    weak var viewController: UIViewController?
    
    init(
        resolver: Resolver
    ) {
        self.resolver = resolver
    }
}
