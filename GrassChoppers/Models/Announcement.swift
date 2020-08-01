struct Announcement {
    enum Category: String {
        case generic
    }
    
    let title: String
    let subtitle: String
    let category: Category
}
