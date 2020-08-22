import UIKit

protocol NewsInteractorOutput: AnyObject {
    func returnNewsData(section: NewsSections, data: Data)
}

protocol NewsInteractorInput {
    func getNews(section: NewsSections)
}

class NewsInteractor {
    weak var output: NewsInteractorOutput?
    private let errorHandler: ErrorHandler
    private let network: NetworkClientService

    init(errorHandler: ErrorHandler, network: NetworkClientService) {
        self.errorHandler = errorHandler
        self.network = network
    }

    // MARK: - Private Methods

    private func requestNews(_ section: NewsSections) {
        network.requestNews(
            method: .get,
            event: section
        ) { [weak self] (result: NetworkClientService.CallbackResult) in
            guard let self = self else { return }
            switch result {
            case let .success(response: data):
                self.output?.returnNewsData(section: section, data: data)
            case let .failure(error: error):
                self.errorHandler.handle(error: error)
            }
        }
    }
}

// MARK: - NewsInteractorInput

extension NewsInteractor: NewsInteractorInput {
    func getNews(section: NewsSections) {
        requestNews(section)
    }
}
