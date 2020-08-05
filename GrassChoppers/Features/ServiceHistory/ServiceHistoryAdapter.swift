import UIKit

protocol ServiceHistoryDataAdapting {
    func update(transactions: [String])
}

protocol ServiceHistoryCollectionViewAdapting: CollectionViewAdapting { }

class ServiceHistoryCollectionViewAdapter: NSObject {

    private var transactions: [String] = []
    
    override init() {
        
    }
}

extension ServiceHistoryCollectionViewAdapter: ServiceHistoryCollectionViewAdapting {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(ofType: TitleCollectionViewCell.self, for: indexPath)
        cell.populate(title: transactions[indexPath.row])
        return cell
    }
}

extension ServiceHistoryCollectionViewAdapter: ServiceHistoryDataAdapting {
    
    func update(transactions: [String]) {
        self.transactions = transactions
    }
}
