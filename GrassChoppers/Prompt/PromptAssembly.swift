import Swinject

final class PromptAssembly: Assembly {
    
    typealias Router = PromptRouting
    
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
        
        container.register(PromptViewController.self) { resolver in
            return PromptViewController(
                logicController: resolver.resolve(PromptLogicControlling.self)!
            )
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
        
        container.register(PromptLogicControlling.self) { resolver in
            return PromptLogicController(
                dataManager: resolver.resolve(PromptDataManaging.self)!,
                router: resolver.resolve(PromptRouting.self)!
            )
        }
    }
    
    func assemble(container: Container) {
        
        container.register(PromptModuleType.self) { resolver in
            return PromptModule(resolver: resolver)
        }
        
    }
}
