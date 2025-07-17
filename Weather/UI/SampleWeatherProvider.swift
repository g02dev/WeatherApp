import SwiftUI

struct SampleWeatherProvider: PreviewModifier {
    static func makeSharedContext() async throws -> WeatherProvider {
        return WeatherProvider(client: nil)
    }

    func body(content: Content, context: WeatherProvider) -> some View {
        content
            .environment(context)
    }
}
