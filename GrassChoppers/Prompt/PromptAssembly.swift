import Swinject

final class PromptAssembly: Assembly {
    
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
        
        container.register(PromptModuleType.self) { resolver in
            return PromptModule(resolver: resolver)
        }
        
    }
}
