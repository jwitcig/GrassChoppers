import Swinject
import UIKit

protocol ModuleType {
    
    func createViewController() -> UIViewController
}

final class Module: ModuleType {
    
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func createViewController() -> UIViewController {
        return resolver.resolve(ViewController.self)!
    }
}
