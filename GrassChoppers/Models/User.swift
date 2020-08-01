struct User {
    let id: Identifier
    let firstName: String
    let lastName: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    let address: String
    let email: String
    let phoneNumber: String
}
