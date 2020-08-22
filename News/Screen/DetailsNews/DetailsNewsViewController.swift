import UIKit

protocol DetailsNewsViewInput: AnyObject {}

protocol DetailsNewsViewOutput {}

class DetailsNewsViewController: ScrollStackViewController, ScreenTransitionable {
    // MARK: - Properties

    let output: DetailsNewsViewOutput
    private let newsData: NewsCellViewModel

    private let titleNews = UILabel()
    private let imageNews = NewsImageView(image: nil)
    private let dateNews = UILabel()
    private let descreNews = UILabel()

    // MARK: - Lifecycle

    init(output: DetailsNewsViewOutput, newsData: NewsCellViewModel) {
        self.output = output
        self.newsData = newsData
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }

    // MARK: - Prepare View

    private func prepareView() {
        view.apply(.backgroundView)
        setTitleNews()
        setImageNews()
        setDateNews()
        setDescrNews()
    }

    private func setTitleNews() {
        titleNews.apply(.title)
        titleNews.text = newsData.news.title
        stackView.addArrangedSubview(titleNews)
    }

    private func setImageNews() {
        imageNews.setImage(urlString: newsData.news.enclosure)
        (imageNews as UIImageView).apply(.scaleAspectFit)
        stackView.addArrangedSubview(imageNews)
    }

    private func setDateNews() {
        dateNews.apply(.descr)
        dateNews.text = DateUtils.getStringFromSeconds(seconds: TimeInterval(newsData.news.pubDate),
                                                       format: .date)
        stackView.addArrangedSubview(dateNews)
    }

    private func setDescrNews() {
        descreNews.apply(.subTitle)
        descreNews.text = newsData.news.description
        stackView.addArrangedSubview(descreNews)
    }

    // MARK: - Actions
}

// MARK: - DetailsNewsViewInput

extension DetailsNewsViewController: DetailsNewsViewInput {}
