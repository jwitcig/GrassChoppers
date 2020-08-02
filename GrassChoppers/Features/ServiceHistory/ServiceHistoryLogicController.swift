protocol ServiceHistoryLogicControlling: ListLogicControlling {}

class ServiceHistoryLogicController: ServiceHistoryLogicControlling {
    
    private let dataManager: ServiceHistoryDataManaging
    private let adapter: ServiceHistoryDataAdapting
    
    var delegate: ListLogicControllingDelegate?
    
    init(dataManager: ServiceHistoryDataManaging, adapter: ServiceHistoryDataAdapting) {
        self.dataManager = dataManager
        self.adapter = adapter
        self.dataManager.delegate = self
    }
    
    func componentDidLoad() {
        dataManager.requestInitialState()
    }
}

extension ServiceHistoryLogicController: ServiceHistoryDataManagingDelegate {
    func didFetchHistory(services: [String]) {
        adapter.update(transactions: services)
        delegate?.updateData()
    }
}
