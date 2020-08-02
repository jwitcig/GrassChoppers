import Swinject

final class ListAssembly: Assembly {
    
    typealias Router = ListRouting
    
    private let container: Container
    private let routerFactory: (Resolver) -> Router
    
    init(
        parentContainer: Container,
        routerFactory: @escaping (Resolver) -> Router
    ) {
        self.container = Container(parent: parentContainer)
        self.routerFactory = routerFactory
        
        privatelyAssemble()
    }

    private func privatelyAssemble() {
        
        container.register(ListViewController.self) { resolver in
            return ListViewController(
                logicController: resolver.resolve(ListLogicControlling.self)!
            )
        }.initCompleted { resolver, viewController in
            resolver.resolve(Router.self)!.viewController = viewController
        }
        
        container.register(ListLogicControlling.self) { resolver in
            return ListLogicController(
                dataManager: resolver.resolve(ListDataManaging.self)!,
                router: resolver.resolve(ListRouting.self)!
            )
        }
        
        container.register(ListDataManaging.self) { resolver in
            return ListDataManager()
        }
        
        container.register(Router.self, factory: routerFactory)
        
        container.register(ListLogicControlling.self) { resolver in
            return ListLogicController(
                dataManager: resolver.resolve(ListDataManaging.self)!,
                router: resolver.resolve(Router.self)!
            )
        }
    }
    
    func assemble(container publicContainer: Container) {
        
        publicContainer.register(ListModuleType.self) { resolver in
            return ListModule(resolver: self.container)
        }
        
    }
}
