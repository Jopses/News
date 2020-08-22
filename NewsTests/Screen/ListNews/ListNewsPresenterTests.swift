import XCTest
@testable import News

class ListNewsPresenterTests: XCTestCase {

    // MARK: - Properties

    private var presenter: ListNewsPresenter!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()

        let router = ListNewsRouterMock()
        let view = ListNewsViewControllerMock()
        let output = RootScreenInputMock()
        presenter = ListNewsPresenter(router: router)
        presenter.view = view
        presenter.output = output
    }

    // MARK: - Tests

}
