import UIKit

class DateUtils {
    static func getStringFromSeconds(seconds: TimeInterval,
                                     format: DateFormat = .sendAgainTimer) -> String {
        let date = Date(timeIntervalSince1970: seconds)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        let selectedDate = dateFormatter.string(from: date)
        return selectedDate
    }

    static func getSecondsFromString(dateString: String,
                                     format: DateFormat = .date) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        let date = dateFormatter.date(from: dateString)
        return Int(date?.timeIntervalSince1970 ?? 0)
    }
}
