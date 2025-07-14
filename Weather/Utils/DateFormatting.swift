import Foundation

enum DateFormatting {
    static func shortLocalTime(date: Date, timeZone: TimeZone, locale: Locale = .current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = locale
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}
