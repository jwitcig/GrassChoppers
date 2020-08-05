import Swinject

class ServiceHistoryFeature: Assembly {
    
    private let container: Container
    
    init(
        parentContainer: Container
    ) {
        self.container = Container(parent: parentContainer)
        
        privatelyAssemble()
    }
    
    func privatelyAssemble() {
        
        ListAssembly(
            parentContainer: container,
            adapterFactory: { _ in
                ServiceHistoryCollectionViewAdapter()
            },
            logicFactory: { _, dataManger, adapter in
                ServiceHistoryLogicController(
                    dataManager: dataManger,
                    adapter: adapter
                )
            },
            dataFactory: { _ in ServiceHistoryDataManager() },
            routerFactory: ServiceHistoryFeatureRouter.init
        ).assemble(container: container)
        
    }
    
    func assemble(container: Container) {
        container.register(ServiceHistoryFeature.self) { resolver in
            return self
        }
    }
    
    func createEntryViewController() -> UIViewController {
        return container.resolve(ListModuleType.self)!.createViewController()
    }
}
