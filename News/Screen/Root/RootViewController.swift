import UIKit

protocol RootViewInput: AnyObject {}

protocol RootViewOutput {
    func viewDidLoad()
}

class RootViewController: UINavigationController, ScreenTransitionable, UserMessagesView {
    // MARK: - Properties

    let output: RootViewOutput

    // MARK: - Lifecycle

    init(output: RootViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        output.viewDidLoad()
    }

    // MARK: - Prepare View

    private func prepareView() {}

    // MARK: - Actions
}

// MARK: - RootViewInput

extension RootViewController: RootViewInput {}
