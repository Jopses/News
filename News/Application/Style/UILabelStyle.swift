import UIKit

extension StyleWrapper where Element == UILabel {
    static var base: StyleWrapper {
        return .wrap { label, theme in
            label.numberOfLines = 0
            label.textColor = theme.colorPalette.onBackground
            label.textAlignment = .left
        }
    }

    static var title: StyleWrapper {
        return .wrap { label, theme in
            label.apply(.base)
            label.font = theme.typography.header5
        }
    }

    static var subTitle: StyleWrapper {
        return .wrap { label, theme in
            label.apply(.base)
            label.font = theme.typography.subtitle1
        }
    }

    static var descr: StyleWrapper {
        return .wrap { label, theme in
            label.apply(.base)
            label.font = theme.typography.subtitle2
        }
    }

    static var errorLabel: StyleWrapper {
        return .wrap { label, theme in
            label.numberOfLines = 0
            label.textColor = theme.colorPalette.error
            label.textAlignment = .center
            label.font = theme.typography.subtitle1
        }
    }
}
