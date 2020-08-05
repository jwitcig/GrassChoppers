protocol ListLogicControlling: class {
    var delegate: ListLogicControllingDelegate? { get set }
    
    func componentDidLoad()
}

protocol ListLogicControllingDelegate: class {
    func updateData()
}
