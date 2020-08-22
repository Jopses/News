import UIKit
extension StyleWrapper where Element == UIStackView {
    static var primary: StyleWrapper {
        return .wrap { stackView, _ in
            stackView.alignment = .fill
            stackView.distribution = .fill
            stackView.spacing = Grid.sm.offset
            stackView.axis = .vertical
            stackView.isLayoutMarginsRelativeArrangement = true
            stackView.layoutMargins = UIEdgeInsets(
                top: Grid.xs.offset,
                left: Grid.zero.offset,
                bottom: Grid.sm.offset,
                right: Grid.zero.offset
            )
        }
    }

    static var secondary: StyleWrapper {
        return .wrap { stackView, _ in
            stackView.alignment = .fill
            stackView.distribution = .fill
            stackView.spacing = Grid.sm.offset
            stackView.axis = .vertical
            stackView.isLayoutMarginsRelativeArrangement = true
        }
    }

    static var horizontal: StyleWrapper {
        return .wrap { stackView, _ in
            stackView.alignment = .firstBaseline
            stackView.distribution = .fill
            stackView.spacing = Grid.sm.offset
            stackView.axis = .horizontal
            stackView.isLayoutMarginsRelativeArrangement = true
        }
    }

    static var horizontalTitle: StyleWrapper {
        return .wrap { stackView, _ in
            stackView.alignment = .fill
            stackView.distribution = .equalSpacing
            stackView.spacing = Grid.sm.offset
            stackView.axis = .horizontal
            stackView.isLayoutMarginsRelativeArrangement = true
        }
    }
}
