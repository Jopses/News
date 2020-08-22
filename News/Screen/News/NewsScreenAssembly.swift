import UIKit

class NewsScreenAssembly {
    func assemble(output: RootScreenInput? = nil, errorHandler: ErrorHandler) -> NewsViewController {
        let router = NewsRouter()
        let network = NetworkClientService(errorHandler: errorHandler)
        let interactor = NewsInteractor(errorHandler: errorHandler, network: network)
        let presenter = NewsPresenter(router: router, interactor: interactor)
        let view = NewsViewController(output: presenter)
        interactor.output = presenter
        presenter.view = view
        presenter.output = output
        router.view = view
        errorHandler.messagesView = view

        return view
    }
}
