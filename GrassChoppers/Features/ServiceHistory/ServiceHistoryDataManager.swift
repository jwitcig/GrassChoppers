
protocol ServiceHistoryDataManaging: class {
    var delegate: ServiceHistoryDataManagingDelegate? { get set }
    
    func requestInitialState()
}

protocol ServiceHistoryDataManagingDelegate {
    func didFetchHistory(services: [String])
}

class ServiceHistoryDataManager: ServiceHistoryDataManaging {
    var delegate: ServiceHistoryDataManagingDelegate?
    
    func requestInitialState() {
        deliverHistory()
    }
    
    private func deliverHistory() {
        delegate?.didFetchHistory(services: ["Jonah", "Travis", "Witcig"])
    }
}
