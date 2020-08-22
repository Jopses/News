import UIKit

class NewsCell: PreparableTableCell {
    // MARK: - Properties

    var viewModel: NewsCellViewModel? {
        didSet {
            guard let news = viewModel?.news else { return }
            textLabel?.text = news.title
        }
    }

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
    }

    override func prepare(withViewModel viewModel: PreparableViewModel?) {
        prepareView()
        self.viewModel = viewModel as? NewsCellViewModel
    }

    // MARK: - Prepare View

    private func prepareView() {
        contentView.clipsToBounds = true
        selectionStyle = .none
        tintColor = theme.colorPalette.onBackground
        textLabel?.apply(.descr)
    }
}
