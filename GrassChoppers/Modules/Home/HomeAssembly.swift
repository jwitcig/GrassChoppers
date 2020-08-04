import Swinject

final class HomeAssembly: Assembly {
    
    typealias Router = HomeRouting
    
    private let container: Container
    private let routerFactory: (Resolver) -> Router
    private let theme: Theme
    
    init(
        parentContainer: Container,
        routerFactory: @escaping (Resolver) -> Router,
        theme: Theme
    ) {
        self.container = Container(parent: parentContainer)
        self.routerFactory = routerFactory
        self.theme = theme
        
        privatelyAssemble()
    }

    private func privatelyAssemble() {
     
        container.register(HomeViewController.self) { [theme] resolver in
            return HomeViewController(
                logicController: resolver.resolve(HomeLogicControlling.self)!,
                theme: theme
            )
        }.initCompleted { resolver, viewController in
            resolver.resolve(HomeRouting.self)!.viewController = viewController
        }
        
        container.register(HomeLogicControlling.self) { resolver in
            return HomeLogicController(
                dataManager: resolver.resolve(HomeDataManaging.self)!,
                router: resolver.resolve(HomeRouting.self)!
            )
        }
        
        container.register(HomeDataManaging.self) { resolver in
            return HomeDataManager()
        }
        
        container.register(Router.self, factory: routerFactory)
        
        container.register(HomeLogicControlling.self) { resolver in
            return HomeLogicController(
                dataManager: resolver.resolve(HomeDataManaging.self)!,
                router: resolver.resolve(HomeRouting.self)!
            )
        }
    }
    
    func assemble(container publicContainer: Container) {
        publicContainer.register(HomeModuleType.self) { resolver in
            return HomeModule(resolver: self.container)
        }
    }
}
