import Swinject

protocol ProfileRouting: class {
    var viewController: UIViewController? { get set }
}

class ProfileRouter: ProfileRouting {
    
    private let resolver: Resolver
    
    weak var viewController: UIViewController?
    
    init(
        resolver: Resolver
    ) {
        self.resolver = resolver
    }
}
