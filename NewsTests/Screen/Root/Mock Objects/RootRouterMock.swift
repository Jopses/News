@testable import News

class RootRouterMock: RootRouterInput {
    func pushScreen(output: RootScreenInput, errorHandler: ErrorHandler, animated: Bool) {}
    func pushScreenListNews(output: RootScreenInput?, sectionData: [NewsCellViewModel]) {}
    func pushScreenDetailsNews(newsData: NewsCellViewModel) {}
}
