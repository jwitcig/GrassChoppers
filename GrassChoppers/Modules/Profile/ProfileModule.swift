import Swinject
import UIKit

protocol ProfileModuleType {
    
    func createViewController() -> UIViewController
}

final class ProfileModule: ProfileModuleType {
    
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func createViewController() -> UIViewController {
        return resolver.resolve(ProfileAssembly.View.self)!
    }
}
