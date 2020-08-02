import Swinject
import UIKit

class ServiceHistoryFeatureRouter: ListRouting {
    
    private let resolver: Resolver
    
    var viewController: UIViewController?
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
}
