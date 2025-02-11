//
//  WeatherContentView.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import SwiftUI

struct WeatherContentView: View {
    
    let viewModel: WeatherViewModel
    
    var body: some View {
        ScrollView {
            weatherView(viewModel: viewModel)
        }
        .scrollIndicators(.hidden)
        .padding()
    }
    
    @ViewBuilder
    private func weatherView(viewModel: WeatherViewModel) -> some View {
        if let weather = viewModel.currentWeather {
            LazyVStack(spacing: 20) {
                HeadlineView(weather: weather, coordinate: viewModel.currentLocation)
                
                HourlyForecastView(hourlyWeather: viewModel.getHourlyForecastData())
                
                DailyForecastView(dailyWeather: viewModel.getDailyForecastData())
                
                WeatherDetailsView(current: weather.current)
            }
        } else {
            LoadingView()
        }
    }
}

#Preview {
    @Previewable @State var viewModel = WeatherViewModel(weathers: Weather.mock)
    WeatherContentView(viewModel: viewModel)
}
