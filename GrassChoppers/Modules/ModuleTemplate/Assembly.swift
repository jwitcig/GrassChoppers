import Swinject

final class AssemblyClass: Assembly {
    
    typealias Router = Routing
    
    private let container: Container
    private let routerFactory: (Resolver) -> Routing
    
    init(
        parentContainer: Container,
        routerFactory: @escaping (Resolver) -> Routing
    ) {
        self.container = Container(parent: parentContainer)
        self.routerFactory = routerFactory
        
        privatelyAssemble()
    }

    private func privatelyAssemble() {
        
        container.register(ViewController.self) { resolver in
            return ViewController(
                logicController: resolver.resolve(LogicControlling.self)!
            )
        }.initCompleted { resolver, viewController in
            resolver.resolve(Routing.self)!.viewController = viewController
        }
        
        container.register(LogicControlling.self) { resolver in
            return LogicController(
                dataManager: resolver.resolve(DataManaging.self)!,
                router: resolver.resolve(Routing.self)!
            )
        }
        
        container.register(DataManaging.self) { resolver in
            return DataManager()
        }
        
        container.register(Router.self, factory: routerFactory)
        
        container.register(LogicControlling.self) { resolver in
            return LogicController(
                dataManager: resolver.resolve(DataManaging.self)!,
                router: resolver.resolve(Routing.self)!
            )
        }
    }
    
    func assemble(container: Container) {
        
        container.register(ModuleType.self) { resolver in
            return Module(resolver: resolver)
        }
        
    }
}
