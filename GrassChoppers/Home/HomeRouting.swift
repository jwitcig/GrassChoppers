import Swinject

protocol HomeRouting: class {
    var viewController: UIViewController? { get set }
    
    func routeToNextScreen()
}
