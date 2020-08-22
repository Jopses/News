import UIKit

protocol NetworkClientServiceInput {
    func setUserMessagesView(_ view: UserMessagesView?)
    func requestNews(method: NCSMethod, event: NewsSections,
                     completion: @escaping NetworkClientService.Callback)
}

open class NetworkClientService: NetworkClientServiceInput {
    public enum CallbackResult {
        case success(response: Data)
        case failure(error: Error)
    }

    typealias Callback = (CallbackResult) -> Void

    // MARK: - Properties

    private let errorHandler: ErrorHandler
    private let sessionConfig: URLSessionConfiguration

    func setUserMessagesView(_ view: UserMessagesView?) {
        errorHandler.messagesView = view
    }

    // MARK: - Lifecycle

    init(errorHandler: ErrorHandler) {
        self.errorHandler = errorHandler
        sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30.0
        sessionConfig.timeoutIntervalForResource = 30.0
    }

    func requestNews(method: NCSMethod, event: NewsSections, completion: @escaping Callback) {
        guard let requestUrl = URL(string: AppDefaults.baseUrl + event.path) else {
            failure(NetworkErrors.urlNotValid, completion: completion)
            return
        }

        let session = URLSession(configuration: sessionConfig)
        var networkRequest = URLRequest(url: requestUrl)
        networkRequest.httpMethod = method.rawValue

        session.dataTask(with: networkRequest) { [weak self] data, response, error in
            guard let self = self else { return }
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200 ... 299:
                    guard let responsesData = data else {
                        self.failure(NetworkErrors.failedToParseResponse, completion: completion)
                        return
                    }
                    DispatchQueue.main.async {
                        completion(.success(response: responsesData))
                    }
                default:
                    guard let error = error else {
                        self.failure(NetworkErrors.unknownError, completion: completion)
                        return
                    }
                    self.failure(error, completion: completion)
                }
            }
        }.resume()
    }

    private func failure(_ error: Error, completion: @escaping Callback) {
        DispatchQueue.main.async {
            self.errorHandler.handle(error: error)
            completion(.failure(error: error))
        }
    }
}
