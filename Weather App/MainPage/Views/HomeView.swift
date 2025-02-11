//
//  ContentView.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import SwiftUI

struct HomeView: View {
    
    @State
    private var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .success:
                WeatherContentView(viewModel: viewModel)
            case .failure(let error):
                ErrorView(message: error.localizedDescription) {
                    await loadData()
                }
            }
        }
        .task {
            await loadData()
        }
    }
    
    private func loadData() async {
        await viewModel.fetchWeatherForecastData()
    }
}

#Preview {
    HomeView()
}
