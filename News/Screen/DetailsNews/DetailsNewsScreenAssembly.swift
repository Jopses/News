import UIKit

class DetailsNewsScreenAssembly {
    func assemble(output: DetailsNewsScreenOutput? = nil, newsData: NewsCellViewModel) -> DetailsNewsViewController {
        let router = DetailsNewsRouter()
        let presenter = DetailsNewsPresenter(router: router)
        let view = DetailsNewsViewController(output: presenter, newsData: newsData)
        presenter.view = view
        presenter.output = output
        router.view = view

        return view
    }
}
