import UIKit

protocol ListNewsRouterInput {}

class ListNewsRouter: ListNewsRouterInput {
    // MARK: - Properties

    weak var view: ScreenTransitionable?

    // MARK: - ListNewsRouterInput
}
