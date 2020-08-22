import XCTest
@testable import News

class NewsPresenterTests: XCTestCase {

    // MARK: - Properties

    private var presenter: NewsPresenter!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()

        let router = NewsRouterMock()
        let view = NewsViewControllerMock()
        let output = RootScreenInputMock()
        let errorHandler = ErrorHandler()
        let network = NetworkClientService(errorHandler: errorHandler)
        let interactor = NewsInteractor(errorHandler: errorHandler, network: network)
        presenter = NewsPresenter(router: router, interactor: interactor)
        presenter.view = view
        presenter.output = output
    }

    // MARK: - Tests

}
