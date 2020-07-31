import Swinject

final class AssemblyClass: Assembly {
    
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
        
        container.register(ModuleType.self) { resolver in
            return Module(resolver: container)
        }
        
    }
}
