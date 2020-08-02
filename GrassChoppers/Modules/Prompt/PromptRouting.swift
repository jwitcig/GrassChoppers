import Swinject

protocol PromptRouting: class {
    var viewController: UIViewController? { get set }
}
