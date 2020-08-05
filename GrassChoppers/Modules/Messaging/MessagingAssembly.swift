import Swinject
import ThemeKit

final class MessagingAssembly: Assembly {
    
    typealias View = MessagingViewController
    typealias Logic = MessagingLogicControlling
    typealias Data = MessagingDataManaging
    typealias Router = MessagingRouting

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
            return MessagingViewController(
                logicController: resolver.resolve(Logic.self)!,
                theme: resolver.resolve(ThemeType.self)!
            )
        }.initCompleted { resolver, viewController in
            resolver.resolve(Router.self)!.viewController = viewController
        }
        
        container.register(Logic.self) { resolver in
            return MessagingLogicController(
                dataManager: resolver.resolve(Data.self)!,
                router: resolver.resolve(Router.self)!
            )
        }
        
        container.register(Data.self) { resolver in
            return MessagingDataManager()
        }
        
        container.register(Router.self, factory: routerFactory)
    }
    
    func assemble(container publicContainer: Container) {
        publicContainer.register(MessagingModuleType.self) { resolver in
            return MessagingModule(resolver: self.container)
        }
    }
}
