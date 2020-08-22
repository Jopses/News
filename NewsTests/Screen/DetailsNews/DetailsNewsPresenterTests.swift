import XCTest
@testable import News

class DetailsNewsPresenterTests: XCTestCase {

    // MARK: - Properties

    private var presenter: DetailsNewsPresenter!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()

        let router = DetailsNewsRouterMock()
        let view = DetailsNewsViewControllerMock()
        let output = DetailsNewsScreenOutputMock()
        presenter = DetailsNewsPresenter(router: router)
        presenter.view = view
        presenter.output = output
    }

    // MARK: - Tests

}
