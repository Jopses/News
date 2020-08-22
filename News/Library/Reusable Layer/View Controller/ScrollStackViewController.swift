import SnapKit
import UIKit

class ScrollStackViewController: UIViewController {
    // MARK: - Properties

    let scrollView = UIScrollView()
    let contentView = UIView()
    let stackView = UIStackView()

    var scrollViewTopOffset: CGFloat {
        return 0.0
    }

    var scrollViewBottomOffset: CGFloat {
        return 0.0
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
        setContentView()
        setStackView()
    }

    // MARK: - Prepare View

    private func setScrollView() {
        scrollView.apply(.primary)
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }

    private func setContentView() {
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets(top: scrollViewTopOffset, left: 0,
                                                              bottom: scrollViewBottomOffset, right: 0))
            make.width.equalTo(scrollView.snp.width)
        }
    }

    private func setStackView() {
        stackView.apply(.primary)
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 0, left: Grid.s.offset,
                                                               bottom: 0, right: Grid.s.offset))
        }
    }
}
