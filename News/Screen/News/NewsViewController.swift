import UIKit

protocol NewsViewInput: AnyObject {
    func createNewsBlock(section: NewsSections, data: [RssNewsResponses])
}

protocol NewsViewOutput {
    func viewDidLoad()
    func viewNews(_ section: NewsSections)
}

class NewsViewController: ScrollStackViewController, ScreenTransitionable, UserMessagesView {
    // MARK: - Properties

    let output: NewsViewOutput

    private var stackViewSections: [NewsSections: UIStackView] = [:]

    override var scrollViewTopOffset: CGFloat {
        return Grid.m.offset
    }

    // MARK: - Lifecycle

    init(output: NewsViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
        NewsSections.allCases.forEach {
            let view = UIStackView()
            view.apply(.secondary)
            stackViewSections[$0] = view
        }
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

    private func prepareView() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.apply(.backgroundView)
        setBaseNewsBlock()
    }

    private func setBaseNewsBlock() {
        NewsSections.allCases.forEach {
            setTitleBlock($0)
            setIndicatorBlock($0)
        }
    }

    private func setTitleBlock(_ section: NewsSections) {
        let view = UIStackView()
        view.apply(.horizontalTitle)
        stackView.addArrangedSubview(view)
        view.addArrangedSubview(titleLabel(section.title))
        view.addArrangedSubview(titleButton(section.rawValue))
    }

    private func titleLabel(_ title: String) -> UILabel {
        let label = UILabel()
        label.apply(.title)
        label.text = title
        return label
    }

    private func titleButton(_ index: Int) -> UIButton {
        let button = UIButton()
        button.apply(.primary)
        button.tag = index
        button.setTitle(R.string.localizable.view(), for: .normal)
        button.addTarget(self, action: #selector(viewNews(_:)), for: .touchUpInside)
        return button
    }

    private func setIndicatorBlock(_ section: NewsSections) {
        if let newsStackView = stackViewSections[section] {
            stackView.addArrangedSubview(newsStackView)
            let activityIndicator = UIActivityIndicatorView(style: .medium)
            activityIndicator.startAnimating()
            newsStackView.addArrangedSubview(activityIndicator)
        }
    }

    private func setLabelNotFound(_ section: NewsSections) {
        if let newsStackView = stackViewSections[section] {
            newsStackView.removeAllArrangedSubviews()
            let label = UILabel()
            label.apply(.errorLabel)
            label.text = R.string.localizable.notFound()
            newsStackView.addArrangedSubview(label)
        }
    }

    private func setSingleNewsSection(section: NewsSections, data: [RssNewsResponses]) {
        if let newsStackView = stackViewSections[section] {
            newsStackView.removeAllArrangedSubviews()
            data.enumerated().forEach {
                if $0 >= 4 { return }
                let label = UILabel()
                label.apply(.descr)
                label.text = $1.title
                newsStackView.addArrangedSubview(label)
            }
        }
    }

    private func setDoubleNewsSection(section: NewsSections, data: [RssNewsResponses]) {
        if let newsStackView = stackViewSections[section] {
            newsStackView.removeAllArrangedSubviews()
            var view = UIStackView()
            view.apply(.horizontal)
            data.enumerated().forEach {
                if $0 >= 4 { return }
                let label = UILabel()
                label.apply(.descr)
                label.text = $1.title
                view.addArrangedSubview(label)
                if ($0 % 2) == 1 {
                    newsStackView.addArrangedSubview(view)
                    view = UIStackView()
                    view.apply(.horizontal)
                }
            }
        }
    }

    // MARK: - Actions

    @objc func viewNews(_ button: UIButton) {
        if let section = NewsSections(rawValue: button.tag) {
            output.viewNews(section)
        }
    }
}

// MARK: - NewsViewInput

extension NewsViewController: NewsViewInput {
    func createNewsBlock(section: NewsSections, data: [RssNewsResponses]) {
        if !data.isEmpty {
            switch section {
            case .top7:
                setDoubleNewsSection(section: section, data: data)
            default:
                setSingleNewsSection(section: section, data: data)
            }
        } else {
            setLabelNotFound(section)
        }
    }
}
