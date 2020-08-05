import Swinject
import ThemeKit

final class PromptAssembly: Assembly {
    
    enum DisplayMode {
        case fullScreen
        case card
    }
    
    typealias View = PromptViewControlling & UIViewController
    typealias Router = PromptRouting
    
    private let container: Container
    private let routerFactory: (Resolver) -> Router
    
    private let displayMode: DisplayMode
    
    init(
        parentContainer: Container,
        routerFactory: @escaping (Resolver) -> Router,
        displayMode: DisplayMode
    ) {
        self.container = Container(parent: parentContainer)
        self.routerFactory = routerFactory
        self.displayMode = displayMode
        
        privatelyAssemble()
    }

    private func privatelyAssemble() {
        
        container.register(View.self) { [displayMode] resolver in
            switch displayMode {
            case .fullScreen:
                return FullScreenPromptViewController(
                    logicController: resolver.resolve(PromptLogicControlling.self)!,
                    theme: resolver.resolve(ThemeType.self)!
                )
            case .card:
                return CardPromptViewController(
                    logicController: resolver.resolve(PromptLogicControlling.self)!,
                    theme: resolver.resolve(ThemeType.self)!
                )
            }
        }.initCompleted { resolver, viewController in
            resolver.resolve(PromptRouting.self)!.viewController = viewController
        }
        
        container.register(PromptLogicControlling.self) { resolver in
            return PromptLogicController(
                dataManager: resolver.resolve(PromptDataManaging.self)!,
                router: resolver.resolve(PromptRouting.self)!
            )
        }
        
        container.register(PromptDataManaging.self) { resolver in
            return PromptDataManager()
        }
        
        container.register(Router.self, factory: routerFactory)
    }
    
    func assemble(container publicContainer: Container) {
        
        publicContainer.register(PromptModuleType.self) { resolver in
            return PromptModule(resolver: self.container)
        }
        
    }
}
