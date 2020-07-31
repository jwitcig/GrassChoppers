import Swinject
import UIKit

protocol HomeModuleType {
    
    func createViewController() -> UIViewController
}

final class HomeModule: HomeModuleType {
    
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func createViewController() -> UIViewController {
        return resolver.resolve(HomeViewController.self)!
    }
}
