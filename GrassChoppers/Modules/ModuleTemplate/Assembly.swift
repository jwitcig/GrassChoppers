import Swinject
import ThemeKit

final class AssemblyClass: Assembly {
    
    typealias View = ViewController
    typealias Logic = LogicControlling
    typealias Data = DataManaging
    typealias Router = Routing

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
            return ViewController(
                logicController: resolver.resolve(Logic.self)!,
                theme: resolver.resolve(ThemeType.self)!
            )
        }.initCompleted { resolver, viewController in
            resolver.resolve(Router.self)!.viewController = viewController
        }
        
        container.register(Logic.self) { resolver in
            return LogicController(
                dataManager: resolver.resolve(Data.self)!,
                router: resolver.resolve(Router.self)!
            )
        }
        
        container.register(Data.self) { resolver in
            return DataManager()
        }
        
        container.register(Router.self, factory: routerFactory)
    }
    
    func assemble(container publicContainer: Container) {
        publicContainer.register(ModuleType.self) { resolver in
            return Module(resolver: self.container)
        }
    }
}
