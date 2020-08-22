protocol ListNewsScreenOutput: AnyObject {}

protocol ListNewsScreenInput: AnyObject {}

class ListNewsPresenter {
    // MARK: - Properties

    weak var view: ListNewsViewInput?
    let router: ListNewsRouterInput
    weak var output: RootScreenInput?

    // MARK: - Lifecycle

    init(router: ListNewsRouterInput) {
        self.router = router
    }

    // MARK: - Private Methods
}

// MARK: - ListNewsViewOutput

extension ListNewsPresenter: ListNewsViewOutput {}

// MARK: - ListNewsTableAdapterOutput

extension ListNewsPresenter: ListNewsTableAdapterOutput {
    func selectedNews(_ data: NewsCellViewModel) {
        output?.runDetailsNews(data)
    }
}

// MARK: - ListNewsScreenInput

extension ListNewsPresenter: ListNewsScreenInput {}
