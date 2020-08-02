import Swinject

class HomeFeature: Assembly {
    
    private let container: Container
    
    init(
        parentContainer: Container
    ) {
        self.container = Container(parent: parentContainer)
        
        privatelyAssemble()
    }
    
    func privatelyAssemble() {
        
        HomeAssembly(
            parentContainer: container,
            routerFactory: HomeFeatureRouter.init
        ).assemble(container: container)
        
    }
    
    func assemble(container: Container) {
        container.register(HomeModuleType.self) { resolver in
            return HomeModule(resolver: resolver)
        }
    }
    
    func createEntryViewController() -> UIViewController {
        return container.resolve(HomeModuleType.self)!.createViewController()
    }
}
