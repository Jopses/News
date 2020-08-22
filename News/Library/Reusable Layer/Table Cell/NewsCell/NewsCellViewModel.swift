class NewsCellViewModel: PreparableViewModel {
    let cellId: String = NewsCell.className
    let news: NewsCellModel

    init(news: NewsCellModel) {
        self.news = news
    }
}
