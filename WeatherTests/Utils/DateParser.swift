import Foundation

struct DateParser {
    static func parseISO8601Date(_ string: String) throws -> Date {
        let formatStyle = Date.ISO8601FormatStyle()
        return try formatStyle.parse(string)
    }
}
