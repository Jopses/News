import UIKit

protocol NewsRouterInput {}

class NewsRouter: NewsRouterInput {
    // MARK: - Properties

    weak var view: ScreenTransitionable?

    // MARK: - NewsRouterInput
}
