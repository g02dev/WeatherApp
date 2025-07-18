import SwiftUI
import SwiftData

@main
struct WeatherApp: App {
    @State private var weatherProvider = WeatherProvider()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(weatherProvider)
                .modelContainer(for: FavoriteLocation.self)
        }
    }
}
