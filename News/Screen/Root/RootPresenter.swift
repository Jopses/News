protocol RootScreenOutput: AnyObject {}

protocol RootScreenInput: AnyObject {
    func runListNews(sectionData: [NewsCellViewModel])
    func runDetailsNews(_ data: NewsCellViewModel)
}

class RootPresenter {
    // MARK: - Properties

    weak var view: RootViewInput?
    let router: RootRouterInput
    weak var output: RootScreenOutput?
    private let errorHandler: ErrorHandler

    // MARK: - Lifecycle

    init(router: RootRouterInput, errorHandler: ErrorHandler) {
        self.router = router
        self.errorHandler = errorHandler
    }

    // MARK: - Private Methods

    private func runMainScreen() {
        router.pushScreen(output: self, errorHandler: errorHandler, animated: false)
    }
}

// MARK: - RootViewOutput

extension RootPresenter: RootViewOutput {
    func viewDidLoad() {
        runMainScreen()
    }
}

// MARK: - RootScreenInput

extension RootPresenter: RootScreenInput {
    func runListNews(sectionData: [NewsCellViewModel]) {
        router.pushScreenListNews(output: self, sectionData: sectionData)
    }

    func runDetailsNews(_ data: NewsCellViewModel) {
        router.pushScreenDetailsNews(newsData: data)
    }
}
