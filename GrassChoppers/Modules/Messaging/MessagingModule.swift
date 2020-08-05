import Swinject
import UIKit

protocol MessagingModuleType {
    
    func createViewController() -> UIViewController
}

final class MessagingModule: MessagingModuleType {
    
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func createViewController() -> UIViewController {
        return resolver.resolve(MessagingAssembly.View.self)!
    }
}
