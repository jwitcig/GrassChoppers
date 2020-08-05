import Swinject
import UIKit

protocol LoginModuleType {
    
    func createViewController() -> UIViewController
}

final class LoginModule: LoginModuleType {
    
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func createViewController() -> UIViewController {
        return resolver.resolve(ViewController.self)!
    }
}
