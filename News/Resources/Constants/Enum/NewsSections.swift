enum NewsSections: Int, CaseIterable {
    case top7 = 0
    case last24 = 1
    case all = 2

    var path: String {
        switch self {
        case .top7:
            return "/top7"
        case .last24:
            return "/last24"
        case .all:
            return "/news"
        }
    }

    var title: String {
        switch self {
        case .top7:
            return R.string.localizable.top7()
        case .last24:
            return R.string.localizable.last24()
        case .all:
            return R.string.localizable.all()
        }
    }
}
