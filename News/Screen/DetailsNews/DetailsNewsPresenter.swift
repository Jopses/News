protocol DetailsNewsScreenOutput: AnyObject {}

protocol DetailsNewsScreenInput: AnyObject {}

class DetailsNewsPresenter {
    // MARK: - Properties

    weak var view: DetailsNewsViewInput?
    let router: DetailsNewsRouterInput
    weak var output: DetailsNewsScreenOutput?

    // MARK: - Lifecycle

    init(router: DetailsNewsRouterInput) {
        self.router = router
    }

    // MARK: - Private Methods
}

// MARK: - DetailsNewsViewOutput

extension DetailsNewsPresenter: DetailsNewsViewOutput {}

// MARK: - DetailsNewsScreenInput

extension DetailsNewsPresenter: DetailsNewsScreenInput {}
