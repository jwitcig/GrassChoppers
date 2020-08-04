import UIKit

protocol PromptDataManaging: class {
    var delegate: PromptDataManagingDelegate? { get set }
    
    func requestInitialState()
}

protocol PromptDataManagingDelegate: class {
    func didFetch(title: String, subtitle: String?)
    func didFetch(image: UIImage?)
}

class PromptDataManager: PromptDataManaging {
    
    weak var delegate: PromptDataManagingDelegate?
    
    func requestInitialState() {
        
        // mimmicking the database, since the database would take time to return data
        // this tells the processor to move on and come back to this code later
        DispatchQueue.main.async {
            self.delegate?.didFetch(
                title: "some title from the database",
                subtitle: "some subtitle from the database, some subtitle from the database"
            )
            
            self.delegate?.didFetch(image: #imageLiteral(resourceName: "push-notification-placeholder"))
        }
    }
}
