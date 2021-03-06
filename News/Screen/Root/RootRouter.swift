import UIKit

protocol RootRouterInput {
    func pushScreen(output: RootScreenInput, errorHandler: ErrorHandler, animated: Bool)
    func pushScreenListNews(output: RootScreenInput?, sectionData: [NewsCellViewModel], headerTitle: String)
    func pushScreenDetailsNews(newsData: NewsCellViewModel)
}

class RootRouter: RootRouterInput {
    // MARK: - Properties

    weak var view: ScreenTransitionable?

    // MARK: - RootRouterInput

    func pushScreen(output: RootScreenInput, errorHandler: ErrorHandler, animated: Bool) {
        let screen = NewsScreenAssembly().assemble(output: output, errorHandler: errorHandler)
        view?.push(screen: screen, animated: animated)
    }

    func pushScreenListNews(output: RootScreenInput?, sectionData: [NewsCellViewModel], headerTitle: String) {
        let screen = ListNewsScreenAssembly().assemble(output: output,
                                                       sectionData: sectionData, headerTitle: headerTitle)
        view?.push(screen: screen, animated: true)
    }

    func pushScreenDetailsNews(newsData: NewsCellViewModel) {
        let screen = DetailsNewsScreenAssembly().assemble(newsData: newsData)
        view?.push(screen: screen, animated: true)
    }
}
