import Swinject
import UIKit
import SnapKit

class HomeFeatureRouter: HomeRouting {
    
    private let resolver: Resolver
    
    var viewController: UIViewController?
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func routeToNextScreen() {
        let vc = resolver.resolve(ReviewModuleType.self)!.createViewController()
        vc.view.layer.cornerRadius = 14
        viewController?.addChild(vc)
        viewController?.view.addSubview(vc.view)
        vc.view.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
        }
    }
}
