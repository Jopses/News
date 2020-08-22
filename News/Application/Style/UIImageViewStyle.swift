import UIKit

extension StyleWrapper where Element == UIImageView {
    static var scaleAspectFit: StyleWrapper {
        return .wrap { imageView, _ in
            imageView.contentMode = .scaleAspectFit
        }
    }
}
