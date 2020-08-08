import Swinject
import ThemeKit

final class ProfileAssembly: Assembly {
    
    typealias View = ProfileViewController
    typealias Logic = ProfileLogicControlling
    typealias Data = ProfileDataManaging
    typealias Router = ProfileRouting

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
            return ProfileViewController(
                logicController: resolver.resolve(Logic.self)!,
                theme: resolver.resolve(ThemeType.self)!
            )
        }.initCompleted { resolver, viewController in
            resolver.resolve(Router.self)!.viewController = viewController
        }
        
        container.register(Logic.self) { resolver in
            return ProfileLogicController(
                dataManager: resolver.resolve(Data.self)!,
                router: resolver.resolve(Router.self)!
            )
        }
        
        container.register(Data.self) { resolver in
            return ProfileDataManager()
        }
        
        container.register(Router.self, factory: routerFactory)
    }
    
    func assemble(container publicContainer: Container) {
        publicContainer.register(ProfileModuleType.self) { resolver in
            return ProfileModule(resolver: self.container)
        }
    }
}
