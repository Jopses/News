import XCTest
@testable import News

class RootScreenAssemblyTests: XCTestCase {

    // MARK: - Properties

    private var viewController: RootViewController!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        viewController = RootScreenAssembly().assemble()
    }

    // MARK: - Tests

    func testViewOutput() {
        let isPresenter = viewController.output is RootPresenter
        XCTAssertTrue(isPresenter, "viewController.output is not RootPresenter")
    }

    func testViewInput() {
        guard let presenter = viewController.output as? RootPresenter else {
            XCTFail("Cannot assign viewController.output as RootPresenter")
            return
        }

        let isViewController = presenter.view is RootViewController
        XCTAssertTrue(isViewController, "presenter.view is not RootViewController")
    }

    func testRouterInput() {
        guard let presenter = viewController.output as? RootPresenter else {
            XCTFail("Cannot assign viewController.output as RootPresenter")
            return
        }

        let isRouter = presenter.router is RootRouter
        XCTAssertTrue(isRouter, "presenter.router is not RootRouter")
    }

    func testScreenTransitionable() {
        guard let presenter = viewController.output as? RootPresenter else {
            XCTFail("Cannot assign viewController.output as RootPresenter")
            return
        }
        guard let router = presenter.router as? RootRouter else {
            XCTFail("Cannot assign presenter.router as RootRouter")
            return
        }

        let isViewController = router.view is RootViewController
        XCTAssertTrue(isViewController, "router.view is not RootViewController")
    }
}
