
protocol ServiceHistoryDataManaging: class {
    var delegate: ServiceHistoryDataManagingDelegate? { get set }
    
    func requestInitialState()
}

protocol ServiceHistoryDataManagingDelegate {
    func didFetchHistory(services: [String])
}

class ServiceHistoryDataManager: ServiceHistoryDataManaging {
    var delegate: ServiceHistoryDataManagingDelegate?
    
    private let somethingFromHome: String
    
    init(somethingFromHome: String) {
        self.somethingFromHome = somethingFromHome
    }
    
    func requestInitialState() {
        deliverHistory()
    }
    
    private func deliverHistory() {
        delegate?.didFetchHistory(services: ["Jonah", "Travis", "Witcig", somethingFromHome])
    }
}
