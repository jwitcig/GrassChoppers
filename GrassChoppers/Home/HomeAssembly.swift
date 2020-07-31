import Swinject

final class HomeAssemblyClass: Assembly {
    
    private let container: Container
    
    init(
        parentContainer: Container
    ) {
        self.container = Container(parent: parentContainer)
        
        privatelyAssemble()
    }

    private func privatelyAssemble() {
        
    }
    
    func assemble(container: Container) {
        
        container.register(HomeModuleType.self) { resolver in
            return HomeModule(resolver: container)
        }
        
    }
}
