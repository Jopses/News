@testable import News

class RootScreenInputMock: RootScreenInput {
    func runListNews(sectionData: [NewsCellViewModel]) {}
    func runDetailsNews(_ data: NewsCellViewModel) {}
}
