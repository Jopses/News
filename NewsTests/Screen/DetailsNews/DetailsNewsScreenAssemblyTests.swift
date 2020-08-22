import XCTest
@testable import News

class DetailsNewsScreenAssemblyTests: XCTestCase {

    // MARK: - Properties

    private var viewController: DetailsNewsViewController!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        let model = NewsCellModel(title: "", description: "", pubDate: 0, enclosure: "")
        let cell = NewsCellViewModel(news: model)
        viewController = DetailsNewsScreenAssembly().assemble(newsData: cell)
    }

    // MARK: - Tests

    func testViewOutput() {
        let isPresenter = viewController.output is DetailsNewsPresenter
        XCTAssertTrue(isPresenter, "viewController.output is not DetailsNewsPresenter")
    }

    func testViewInput() {
        guard let presenter = viewController.output as? DetailsNewsPresenter else {
            XCTFail("Cannot assign viewController.output as DetailsNewsPresenter")
            return
        }

        let isViewController = presenter.view is DetailsNewsViewController
        XCTAssertTrue(isViewController, "presenter.view is not DetailsNewsViewController")
    }

    func testRouterInput() {
        guard let presenter = viewController.output as? DetailsNewsPresenter else {
            XCTFail("Cannot assign viewController.output as DetailsNewsPresenter")
            return
        }

        let isRouter = presenter.router is DetailsNewsRouter
        XCTAssertTrue(isRouter, "presenter.router is not DetailsNewsRouter")
    }

    func testScreenTransitionable() {
        guard let presenter = viewController.output as? DetailsNewsPresenter else {
            XCTFail("Cannot assign viewController.output as DetailsNewsPresenter")
            return
        }
        guard let router = presenter.router as? DetailsNewsRouter else {
            XCTFail("Cannot assign presenter.router as DetailsNewsRouter")
            return
        }

        let isViewController = router.view is DetailsNewsViewController
        XCTAssertTrue(isViewController, "router.view is not DetailsNewsViewController")
    }
}
