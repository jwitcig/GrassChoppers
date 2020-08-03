import Swinject
import UIKit

protocol ReviewModuleType {
    
    func createViewController() -> UIViewController
}

final class ReviewModule: ReviewModuleType {
    
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func createViewController() -> UIViewController {
        return resolver.resolve(ReviewViewController.self)!
    }
}
