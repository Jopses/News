import XCTest
@testable import News

class RootPresenterTests: XCTestCase {

    // MARK: - Properties

    private var presenter: RootPresenter!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()

        let router = RootRouterMock()
        let view = RootViewControllerMock()
        let output = RootScreenOutputMock()
        let errorHandler = ErrorHandler()
        presenter = RootPresenter(router: router, errorHandler: errorHandler)
        presenter.view = view
        presenter.output = output
    }

    // MARK: - Tests

}
