import Swinject

final class ReviewAssembly: Assembly {
    
    typealias View = ReviewViewController
    typealias Logic = ReviewLogicControlling
    typealias Data = ReviewDataManaging
    typealias Router = ReviewRouting
    
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
        
        container.register(View.self) { resolver in
            return ReviewViewController(
                logicController: resolver.resolve(Logic.self)!
            )
        }.initCompleted { resolver, viewController in
            resolver.resolve(Router.self)!.viewController = viewController
        }
        
        container.register(Logic.self) { resolver in
            return ReviewLogicController(
                dataManager: resolver.resolve(Data.self)!,
                router: resolver.resolve(Router.self)!
            )
        }
        
        container.register(Data.self) { resolver in
            return ReviewDataManager()
        }
        
        container.register(Router.self, factory: routerFactory)
    }
    
    func assemble(container publicContainer: Container) {
        
        publicContainer.register(ReviewModuleType.self) { resolver in
            return ReviewModule(resolver: self.container)
        }
        
    }
}
