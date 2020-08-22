import UIKit

extension StyleWrapper where Element == UIButton {
    static var primary: StyleWrapper {
        return .wrap { button, theme in
            button.setTitleColor(theme.colorPalette.primary, for: .normal)
            button.titleLabel?.font = theme.typography.button
        }
    }
}
