import Swinject
import UIKit

class HomeFeatureRouter: HomeRouting {
    
    private let resolver: Resolver
    
    var viewController: UIViewController?
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func routeToNextScreen() {
        
    }
}
