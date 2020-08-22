import XCTest
@testable import News

class NewsScreenAssemblyTests: XCTestCase {

    // MARK: - Properties

    private var viewController: NewsViewController!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        let errorHandler = ErrorHandler()
        viewController = NewsScreenAssembly().assemble(errorHandler: errorHandler)
    }

    // MARK: - Tests

    func testViewOutput() {
        let isPresenter = viewController.output is NewsPresenter
        XCTAssertTrue(isPresenter, "viewController.output is not NewsPresenter")
    }

    func testViewInput() {
        guard let presenter = viewController.output as? NewsPresenter else {
            XCTFail("Cannot assign viewController.output as NewsPresenter")
            return
        }

        let isViewController = presenter.view is NewsViewController
        XCTAssertTrue(isViewController, "presenter.view is not NewsViewController")
    }

    func testRouterInput() {
        guard let presenter = viewController.output as? NewsPresenter else {
            XCTFail("Cannot assign viewController.output as NewsPresenter")
            return
        }

        let isRouter = presenter.router is NewsRouter
        XCTAssertTrue(isRouter, "presenter.router is not NewsRouter")
    }

    func testScreenTransitionable() {
        guard let presenter = viewController.output as? NewsPresenter else {
            XCTFail("Cannot assign viewController.output as NewsPresenter")
            return
        }
        guard let router = presenter.router as? NewsRouter else {
            XCTFail("Cannot assign presenter.router as NewsRouter")
            return
        }

        let isViewController = router.view is NewsViewController
        XCTAssertTrue(isViewController, "router.view is not NewsViewController")
    }
}
