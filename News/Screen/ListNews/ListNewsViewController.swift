import SnapKit
import UIKit

protocol ListNewsViewInput: AnyObject {}

protocol ListNewsViewOutput {}

class ListNewsViewController: UIViewController, ScreenTransitionable {
    // MARK: - Properties

    let output: ListNewsViewOutput

    let tableView = UITableView()
    let tableAdapter: ListNewsTableAdapter

    // MARK: - Lifecycle

    init(output: ListNewsViewOutput, tableAdapter: ListNewsTableAdapter) {
        self.output = output
        self.tableAdapter = tableAdapter
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
        navigationController?.setNavigationBarHidden(false, animated: true)
        view.apply(.backgroundView)
        setTableView()
    }

    private func setTableView() {
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.className)
        tableView.dataSource = tableAdapter
        tableView.delegate = tableAdapter
        tableView.separatorStyle = .singleLine
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }

    // MARK: - Actions
}

// MARK: - ListNewsViewInput

extension ListNewsViewController: ListNewsViewInput {}

// MARK: - UINavigationControllerDelegate

extension ListNewsViewController: UINavigationControllerDelegate {
    override func willMove(toParent _: UIViewController?) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
