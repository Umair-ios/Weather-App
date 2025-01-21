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
            if let weather = viewModel.currentWeather {
                LazyVStack(spacing: 20) {
                    HeadlineView(
                        weather: weather,
                        coordinate: viewModel.currentLocation
                    )
                    
                    HourlyForecastView(hourlyWeather: viewModel.getHourlyForecastData())
                    
                    DailyForecastView(dailyWeather: viewModel.getDailyForecastData())
                    
                    WeatherDetailsView(current: weather.current)
                }
            } else {
                LoadingView()
            }
        }
        .scrollIndicators(.hidden)
        .padding()
    }
}
