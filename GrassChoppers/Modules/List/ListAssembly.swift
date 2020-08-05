import Swinject

final class ListAssembly<Adapter: CollectionViewAdapting, DataManaging>: Assembly {
    
    typealias View = ListViewController
    typealias Logic = ListLogicControlling
    typealias Data = DataManaging
    typealias Router = ListRouting

    private let container: Container
    private let adapterFactory: (Resolver) -> Adapter
    private let logicFactory: (Resolver, Data, Adapter) -> Logic
    private let dataFactory: (Resolver) -> Data
    private let routerFactory: (Resolver) -> Router

    init(
        parentContainer: Container,
        adapterFactory: @escaping (Resolver) -> Adapter,
        logicFactory: @escaping (Resolver, Data, Adapter) -> Logic,
        dataFactory: @escaping (Resolver) -> Data,
        routerFactory: @escaping (Resolver) -> Router
    ) {
        self.container = Container(parent: parentContainer)
        self.adapterFactory = adapterFactory
        self.logicFactory = logicFactory
        self.dataFactory = dataFactory
        self.routerFactory = routerFactory

        privatelyAssemble()
    }

    private func privatelyAssemble() {
        
        container.register(ListViewController.self) { resolver in
            return ListViewController(
                logicController: resolver.resolve(ListLogicControlling.self)!,
                adapter: resolver.resolve(Adapter.self)!
            )
        }.initCompleted { resolver, viewController in
            resolver.resolve(Router.self)!.viewController = viewController
        }
        
        container.register(Adapter.self, factory: adapterFactory)
        container.register(Logic.self, factory: { resolver in
            self.logicFactory(resolver, resolver.resolve(Data.self)!, resolver.resolve(Adapter.self)!)
        })
        container.register(Data.self, factory: dataFactory)
        container.register(Router.self, factory: routerFactory)
    }
    
    func assemble(container publicContainer: Container) {
        
        publicContainer.register(ListModuleType.self) { resolver in
            return ListModule(resolver: self.container)
        }
        
    }
}
