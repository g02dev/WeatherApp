import SwiftUI

struct WeatherForecastCell: View {
    let weather: Weather
    
    @ScaledMetric private var imageSize: CGFloat = 40
    
    var body: some View {
        VStack(spacing: 16) {
            VStack {
                Text(DateFormatting.dayOfTheWeek(
                    date: weather.timestamp,
                    timeZone: weather.timezone
                ))
                .fontWeight(.semibold)
                
                Text(DateFormatting.shortLocalTime(
                    date: weather.timestamp,
                    timeZone: weather.timezone
                ))
            }
            .font(.subheadline)
            
            VStack {
                Image(systemName: weather.condition.systemImageName)
                    .resizable()
                    .scaledToFit()
                    .systemImagePalette(weather.condition.systemImagePalette)
                    .frame(width: imageSize, height: imageSize)
                
                Text("\(weather.temperature)°")
            }
            .font(.title2)
            .fontWeight(.bold)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    let location = SampleLocations.london.location
    let weather = SampleWeather.weatherForecast(for: location).first!
    WeatherForecastCell(weather: weather)
}
