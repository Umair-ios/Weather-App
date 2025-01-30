//
//  HeadlineView.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import SwiftUI

struct HeadlineView: View {
    
    let weather: Weather
    let coordinate: Coordinate
    
    @State private var animate = false
    
    var body: some View {
        VStack(spacing: 10) {
            CoordinateText(coordinate: coordinate)
            
            WeatherIcon(
                icon: weather.current.weatherCode.icon,
                animate: $animate
            )
            
            TemperatureDisplay(
                temperature: weather.current.temperature2M,
                feelsLike: weather.current.apparentTemperature,
                description: weather.current.weatherCode.description
            )
        }
    }
}

// MARK: - CoordinateText

struct CoordinateText: View {
    
    let coordinate: Coordinate
    
    var body: some View {
        Text(
            String(
                format: Constants.Texts.coordinates,
                coordinate.latitude,
                coordinate.longitude
            )
        )
        .font(.headline)
        .foregroundStyle(.secondary)
        .lineLimit(1)
        .minimumScaleFactor(0.75)
    }
}

// MARK: - WeatherIcon

struct WeatherIcon: View {
    
    let icon: String
    @Binding var animate: Bool
    
    var body: some View {
        Image(systemName: icon)
            .renderingMode(.original)
            .font(.system(size: 144))
            .symbolEffect(
                .wiggle,
                value: animate
            )
            .onChange(of: icon) {
                animate.toggle()
            }
    }
}

// MARK: - TemperatureDisplay

struct TemperatureDisplay: View {
    
    let temperature: Double
    let feelsLike: Double
    let description: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text(
                String(
                    format: Constants.Texts.temperature,
                    round(temperature)
                )
            )
            .font(.largeTitle)
            
            Text(description)
                .font(.title3)
            
            Text(
                String(
                    format: Constants.Texts.feelsLike,
                    round(feelsLike)
                )
            )
            .font(.headline)
        }
    }
}

#Preview {
    @Previewable @State var viewModel = WeatherViewModel(weathers: Weather.mock)
    HeadlineView(weather: viewModel.currentWeather!, coordinate: viewModel.currentLocation)
}
