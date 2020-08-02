import Swinject

protocol ListRouting: class {
    var viewController: UIViewController? { get set }
}

class ListRouter: ListRouting {
    
    private let resolver: Resolver
    
    weak var viewController: UIViewController?
    
    init(
        resolver: Resolver
    ) {
        self.resolver = resolver
    }
}
