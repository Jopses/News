import UIKit

protocol NewsScreenOutput: AnyObject {}

protocol NewsScreenInput: AnyObject {}

class NewsPresenter {
    // MARK: - Properties

    weak var view: NewsViewInput?
    let router: NewsRouterInput
    private let interactor: NewsInteractorInput
    weak var output: RootScreenInput?
    private var newsData: [NewsSections: [RssNewsResponses]] = [:]

    // MARK: - Lifecycle

    init(router: NewsRouterInput, interactor: NewsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }

    // MARK: - Private Methods
}

// MARK: - NewsViewOutput

extension NewsPresenter: NewsViewOutput {
    func viewDidLoad() {
        NewsSections.allCases.forEach {
            interactor.getNews(section: $0)
        }
    }
}

// MARK: - NewsInteractorOutput

extension NewsPresenter: NewsInteractorOutput {
    func returnNewsData(section: NewsSections, data: Data) {
        let parser = XMLParserRss(data: data)
        let news = parser.getResult()
        newsData[section] = news
        view?.createNewsBlock(section: section, data: news)
    }

    func viewNews(_ section: NewsSections) {
        if let data = newsData[section] {
            var model: [NewsCellViewModel] = []
            data.forEach {
                let news = NewsCellModel(
                    title: $0.title,
                    description: $0.description,
                    pubDate: $0.pubDate,
                    enclosure: $0.enclosure
                )
                model.append(NewsCellViewModel(news: news))
            }
            output?.runListNews(sectionData: model, headerTitle: section.title)
        }
    }
}

// MARK: - NewsScreenInput

extension NewsPresenter: NewsScreenInput {}
