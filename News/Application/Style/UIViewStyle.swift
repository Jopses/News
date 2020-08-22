import UIKit

extension StyleWrapper where Element == UIView {
    static var backgroundView: StyleWrapper {
        return .wrap { view, theme in
            view.backgroundColor = theme.colorPalette.background
        }
    }
}
