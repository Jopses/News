import UIKit

struct RssNewsResponses: Decodable, Equatable {
    let title: String
    let link: String
    let description: String
    let pubDate: Int
    let enclosure: String
    let category: String

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.title == rhs.title &&
            lhs.link == rhs.link &&
            lhs.description == rhs.description &&
            lhs.pubDate == rhs.pubDate &&
            lhs.enclosure == rhs.enclosure &&
            lhs.category == rhs.category
    }
}
