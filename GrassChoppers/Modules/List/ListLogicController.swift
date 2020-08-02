protocol ListLogicControlling: class {
    var delegate: ListLogicControllingDelegate? { get set }
}

protocol ListLogicControllingDelegate: class {

    func updateData()
}
