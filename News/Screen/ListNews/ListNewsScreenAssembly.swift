import UIKit

class ListNewsScreenAssembly {
    func assemble(output: RootScreenInput? = nil, sectionData: [NewsCellViewModel], headerTitle: String) -> ListNewsViewController {
        let router = ListNewsRouter()
        let presenter = ListNewsPresenter(router: router)
        let tableAdapter = ListNewsTableAdapter(sectionData: sectionData, headerTitle: headerTitle)
        let view = ListNewsViewController(output: presenter, tableAdapter: tableAdapter)
        presenter.view = view
        presenter.output = output
        router.view = view
        tableAdapter.output = presenter

        return view
    }
}
