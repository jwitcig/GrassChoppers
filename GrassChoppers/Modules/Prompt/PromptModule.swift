import Swinject
import UIKit

protocol PromptModuleType {
    
    func createViewController() -> UIViewController
}

final class PromptModule: PromptModuleType {
    
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func createViewController() -> UIViewController {
        return resolver.resolve(PromptAssembly.View.self)!
    }
}
