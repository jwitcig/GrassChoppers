import Swinject
import UIKit

protocol ListModuleType {
    
    func createViewController() -> UIViewController
}

final class ListModule: ListModuleType {
    
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func createViewController() -> UIViewController {
        return resolver.resolve(ListViewController.self)!
    }
}
