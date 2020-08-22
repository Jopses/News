import XCTest
@testable import News

class ListNewsScreenAssemblyTests: XCTestCase {

    // MARK: - Properties

    private var viewController: ListNewsViewController!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        let model = NewsCellModel(title: "", description: "", pubDate: 0, enclosure: "")
        let cell = NewsCellViewModel(news: model)
        viewController = ListNewsScreenAssembly().assemble(sectionData: [cell])
    }

    // MARK: - Tests

    func testViewOutput() {
        let isPresenter = viewController.output is ListNewsPresenter
        XCTAssertTrue(isPresenter, "viewController.output is not ListNewsPresenter")
    }

    func testViewInput() {
        guard let presenter = viewController.output as? ListNewsPresenter else {
            XCTFail("Cannot assign viewController.output as ListNewsPresenter")
            return
        }

        let isViewController = presenter.view is ListNewsViewController
        XCTAssertTrue(isViewController, "presenter.view is not ListNewsViewController")
    }

    func testRouterInput() {
        guard let presenter = viewController.output as? ListNewsPresenter else {
            XCTFail("Cannot assign viewController.output as ListNewsPresenter")
            return
        }

        let isRouter = presenter.router is ListNewsRouter
        XCTAssertTrue(isRouter, "presenter.router is not ListNewsRouter")
    }

    func testScreenTransitionable() {
        guard let presenter = viewController.output as? ListNewsPresenter else {
            XCTFail("Cannot assign viewController.output as ListNewsPresenter")
            return
        }
        guard let router = presenter.router as? ListNewsRouter else {
            XCTFail("Cannot assign presenter.router as ListNewsRouter")
            return
        }

        let isViewController = router.view is ListNewsViewController
        XCTAssertTrue(isViewController, "router.view is not ListNewsViewController")
    }
}
