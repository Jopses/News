import SnapKit
import UIKit

class NewsImageView: UIImageView {
    // MARK: - Properties

    override var image: UIImage? {
        didSet {
            if image != nil {
                activityIndicator.removeFromSuperview()
            }
        }
    }

    let activityIndicator = UIActivityIndicatorView(style: .medium)

    // MARK: - Lifecycle

    override init(image: UIImage?) {
        super.init(image: image)
        setActivityIndicator()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Prepare View

    private func setActivityIndicator() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

    // MARK: - Public method

    func setImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            activityIndicator.removeFromSuperview()
            return
        }
        getData(from: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.activityIndicator.removeFromSuperview()
                return
            }
            DispatchQueue.main.async {
                self?.image = UIImage(data: data)
            }
        }
    }

    // MARK: - Private method

    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
