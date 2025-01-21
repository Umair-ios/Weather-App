//
//  ContentView.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import SwiftUI

struct ContentView: View {
    
    private var viewModel = WeatherViewModel()
    
    @State private var errorMessage: String = ""
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            WeatherContentView(viewModel: viewModel)
        }
        .alert(
            errorMessage,
            isPresented: $showAlert
        ) {
            Button(
                Constants.Texts.dismiss,
                role: .cancel
            ) { }
        }
        .task {
            await fetchWeather()
        }
    }
    
    private func fetchWeather() async {
        do {
            try await viewModel.fetchWeatherForecastData()
        } catch {
            errorMessage = error.localizedDescription
            showAlert = true
        }
    }
}

#Preview {
    ContentView()
}
