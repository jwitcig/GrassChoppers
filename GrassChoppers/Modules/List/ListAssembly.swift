import Swinject

final class ListAssembly: Assembly {
    
    typealias Logic = ListLogicControlling
    typealias Data = ListDataManaging
    typealias Router = ListRouting

    private let container: Container
    private let logicFactory: (Resolver) -> Logic
    private let dataFactory: (Resolver) -> Data
    private let routerFactory: (Resolver) -> Router

    init(
        parentContainer: Container,
        logicFactory: @escaping (Resolver) -> Logic,
        dataFactory: @escaping (Resolver) -> Data,
        routerFactory: @escaping (Resolver) -> Router
    ) {
        self.container = Container(parent: parentContainer)
        self.logicFactory = logicFactory
        self.dataFactory = dataFactory
        self.routerFactory = routerFactory

        privatelyAssemble()
    }

    private func privatelyAssemble() {
        
        container.register(ListViewController.self) { resolver in
            return ListViewController(
                logicController: resolver.resolve(ListLogicControlling.self)!,
                adapter: resolver.resolve(CollectionViewAdapting.self)!
            )
        }.initCompleted { resolver, viewController in
            resolver.resolve(Router.self)!.viewController = viewController
        }
        
        container.register(Logic.self, factory: logicFactory)
        container.register(Data.self, factory: dataFactory)
        container.register(Router.self, factory: routerFactory)
    }
    
    func assemble(container publicContainer: Container) {
        
        publicContainer.register(ListModuleType.self) { resolver in
            return ListModule(resolver: self.container)
        }
        
    }
}
