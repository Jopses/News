import UIKit

class RootScreenAssembly {
    func assemble(output: RootScreenOutput? = nil) -> RootViewController {
        let router = RootRouter()
        let errorHandler = ErrorHandler()
        let presenter = RootPresenter(router: router, errorHandler: errorHandler)
        let view = RootViewController(output: presenter)
        presenter.view = view
        presenter.output = output
        router.view = view
        errorHandler.messagesView = view

        return view
    }
}
