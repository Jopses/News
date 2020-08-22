import UIKit

protocol ListNewsTableAdapterOutput: AnyObject {
    func selectedNews(_ data: NewsCellViewModel)
}

class ListNewsTableAdapter: NSObject {
    // MARK: - Properties

    weak var output: ListNewsTableAdapterOutput?
    private let items: [PreparableViewModel]
    private let headerTitle: String

    // MARK: - Lifecycle

    init(sectionData: [NewsCellViewModel], headerTitle: String) {
        items = sectionData
        self.headerTitle = headerTitle
    }
}

// MARK: - UITableViewDataSource

extension ListNewsTableAdapter: UITableViewDataSource {
    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
        return Grid.ml.offset
    }

    func tableView(_: UITableView, titleForHeaderInSection _: Int) -> String? {
        return headerTitle
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellId, for: indexPath)
        if let reusableCell = cell as? PreparableTableCell {
            reusableCell.prepare(withViewModel: viewModel)
        }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ListNewsTableAdapter: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        if items.indices.contains(indexPath.row),
            let data = items[indexPath.row] as? NewsCellViewModel {
            output?.selectedNews(data)
        }
    }
}
