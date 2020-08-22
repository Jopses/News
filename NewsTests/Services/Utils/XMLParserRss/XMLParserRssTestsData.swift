import Foundation
@testable import News

struct XMLParserRssTestsData {

    // MARK: - Test Input

    let input: [Data] = []

    // MARK: - Test Output

    // swiftlint:disable line_length
    let output: [[RssNewsResponses]] = [
        [RssNewsResponses(title: "Title", link: "https://test.com", description: "Text", pubDate: 1598050500, enclosure: "https://image.jpg", category: "Category")],
        [RssNewsResponses(title: "Title", link: "https://test.com", description: "Text", pubDate: 0, enclosure: "https://image.jpg", category: "Category")],
        [],
        [],
        [RssNewsResponses(title: "Title", link: "https://test.com", description: "Text", pubDate: 1598050500, enclosure: "https://image.jpg", category: "Category"),
        RssNewsResponses(title: "Title", link: "https://test.com", description: "Text", pubDate: 0, enclosure: "https://image.jpg", category: "Category")]
    ]
    // swiftlint:enable line_length
}
