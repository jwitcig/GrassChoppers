import Foundation

struct Review {
    let rating: Rating
    let timestamp: Date
    let notes: String
    let userID: Identifier
}

struct Rating {
    let value: Int
    let maxValue: Int
}
