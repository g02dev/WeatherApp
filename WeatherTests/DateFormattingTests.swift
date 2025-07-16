import Foundation
import Testing
@testable import Weather

struct DateFormattingTests {

    @Test(arguments: [
        ("2025-01-01T00:01:00+00:00", "Europe/London", "00:01"), // Standard time, UTC+0
        ("2025-06-01T19:59:59+00:00", "Europe/Paris", "21:59"), // Summer time, UTC+2
    ])
    func localTimeUsingUKLocale(rawDate: String, rawLocalTimeZoneID: String, expectedLocalTime: String) throws {
        // Given
        let date = try DateParser.parseISO8601Date(rawDate)
        let timeZone = try #require(TimeZone(identifier: rawLocalTimeZoneID))
        let locale = Locale(identifier: "en_UK")
        
        // When
        let localTime = DateFormatting.shortLocalTime(date: date, timeZone: timeZone, locale: locale)
        
        // Then
        #expect(localTime == expectedLocalTime)
    }
    
    @Test(arguments: [
        ("2025-01-01T00:01:00+00:00", "Europe/London", "12:01 AM"), // Standard time, UTC+0
        ("2025-06-01T19:59:59+00:00", "Europe/Paris", "9:59 PM"), // Summer time, UTC+2
    ])
    func localTimeUsingUSLocale(rawDate: String, rawLocalTimeZoneID: String, expectedLocalTime: String) throws {
        // Given
        let date = try DateParser.parseISO8601Date(rawDate)
        let timeZone = try #require(TimeZone(identifier: rawLocalTimeZoneID))
        let locale = Locale(identifier: "en_US")
        
        // When
        let localTime = DateFormatting.shortLocalTime(date: date, timeZone: timeZone, locale: locale)
        
        // Then
        #expect(localTime == expectedLocalTime)
    }
    
    @Test(arguments: [
        ("2025-01-01T00:01:00+00:00", "Europe/London", "en_UK", "Wed"), // Standard time, UTC+0
        ("2025-06-01T19:59:59+00:00", "Europe/Paris", "fr_FR", "dim."), // Summer time, UTC+2
        ("2025-06-01T23:59:59+00:00", "Europe/Paris", "fr_FR", "lun."), // Summer time, UTC+2
    ])
    func dayOfTheWeek(
        rawDate: String,
        rawLocalTimeZoneID: String,
        rawLocaleID: String,
        expectedDayOfTheWeek: String
    ) throws {
        // Given
        let date = try DateParser.parseISO8601Date(rawDate)
        let timeZone = try #require(TimeZone(identifier: rawLocalTimeZoneID))
        let locale = Locale(identifier: rawLocaleID)
        
        // When
        let dayOfTheWeek = DateFormatting.dayOfTheWeek(date: date, timeZone: timeZone, locale: locale)
        
        // Then
        #expect(dayOfTheWeek == expectedDayOfTheWeek)
    }
}
