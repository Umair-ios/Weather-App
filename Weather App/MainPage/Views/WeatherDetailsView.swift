//
//  WeatherDetailsView.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import SwiftUI

struct WeatherDetailsView: View {
    
    let current: Current
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Constants.Texts.others)
                .font(.title2)
            
            HStack(spacing: 30) {
                Group {
                    WeatherDetailSection(
                        title: Constants.Texts.wind,
                        systemImage: Constants.SystemImages.wind,
                        details: [
                            String(
                                format: Constants.Texts.windSpeed,
                                current.windSpeed10M
                            ),
                            String(
                                format: Constants.Texts.windDirection,
                                current.windDirection10M
                            ),
                            String(
                                format: Constants.Texts.windGusts,
                                current.windGusts10M
                            )
                        ]
                    )
                    
                    WeatherDetailSection(
                        title: Constants.Texts.precipitation,
                        systemImage: Constants.SystemImages.cloudAndSnow,
                        details: [
                            String(
                                format: Constants.Texts.rain,
                                current.rain
                            ),
                            String(
                                format: Constants.Texts.shower,
                                current.showers
                            ),
                            String(
                                format: Constants.Texts.snowfall,
                                current.snowfall
                            )
                        ]
                    )
                }
                .forecastCardStyle()
            }
        }
        .padding()
    }
}

// MARK: - WeatherDetailSection

struct WeatherDetailSection: View {
    
    let title: String
    let systemImage: String
    let details: [String]
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 10
        ) {
            Label(
                title,
                systemImage: systemImage
            )
            .font(.headline)
            ForEach(details, id: \.self) { detail in
                Text(detail)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    @Previewable @State var viewModel = WeatherViewModel(weathers: Weather.mock)
    WeatherDetailsView(current: viewModel.currentWeather!.current)
}
