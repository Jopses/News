import Foundation

enum NetworkErrors: Error, LocalizedError {
    case urlNotValid
    case failedToParseResponse
    case unknownError

    var errorDescription: String? {
        return localizedDescription
    }

    var localizedDescription: String {
        switch self {
        case .urlNotValid:
            return R.string.localizable.urlAddressIsNotValid()
        case .failedToParseResponse:
            return R.string.localizable.failedToParseResponse()
        case .unknownError:
            return R.string.localizable.unknownError()
        }
    }
}
