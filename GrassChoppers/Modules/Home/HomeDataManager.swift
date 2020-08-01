protocol HomeDataManaging: class {
    var delegate: HomeDataManagingDelegate? { get set }
    
    func requestInitialState()
}

protocol HomeDataManagingDelegate: class {
    func didFetch(name: String)
}

class HomeDataManager: HomeDataManaging {
    
    weak var delegate: HomeDataManagingDelegate?
    
    func requestInitialState() {
        print("Data manager got the message")
        
        // step 0: fetch data from remote database
        
        // step 1: notify logic controller
        delegate?.didFetch(name: "Wasay")
    }
    
}
