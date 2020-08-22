@testable import News

class NewsViewControllerMock: NewsViewInput {
    func createNewsBlock(section: NewsSections, data: [RssNewsResponses]) {}
}
