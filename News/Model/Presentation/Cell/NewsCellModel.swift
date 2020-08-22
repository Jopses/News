import Foundation

struct NewsCellModel: Equatable {
    let title: String
    let description: String
    let pubDate: Int
    let enclosure: String

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.title == rhs.title &&
            lhs.description == rhs.description &&
            lhs.pubDate == rhs.pubDate &&
            lhs.enclosure == rhs.enclosure
    }
}
