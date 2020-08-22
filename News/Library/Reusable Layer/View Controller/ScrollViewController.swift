import SnapKit
import UIKit

class ScrollViewController: UIViewController {
    // MARK: - Properties

    let scrollView = UIScrollView()
    let contentView = UIView()

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
    }

    // MARK: - Prepare View

    private func setScrollView() {
        scrollView.apply(.primary)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: scrollViewTopOffset, left: 0,
                                                        bottom: -scrollViewBottomOffset, right: 0))
//            make.top.equalTo(view.snp.top).offset(scrollViewTopOffset)
//            make.leading.equalTo(view.snp.leading)
//            make.trailing.equalTo(view.snp.trailing)
//            make.bottom.equalTo(view.snp.bottom)
        }
    }

    private func setContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
//            make.top.equalTo(scrollView.snp.top)
//            make.leading.equalTo(scrollView.snp.leading)
//            make.trailing.equalTo(scrollView.snp.trailing)
//            make.bottom.equalTo(view.snp.bottom).offset(-scrollViewBottomOffset)
            make.width.equalTo(scrollView.snp.width)
        }
    }
}
