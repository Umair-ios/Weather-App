//
//  DailyForecastView.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import SwiftUI

struct DailyForecastView: View {
    
    let dailyWeather: [DailyWeather]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Constants.Texts.dailyReport)
                .font(.title2)
            
            ScrollView {
                ForEach(dailyWeather) { data in
                    HStack(spacing: 36) {
                        Text(
                            data.time.formatted(
                                date: .abbreviated,
                                time: .omitted
                            )
                        )
                        Image(systemName: data.icon)
                            .renderingMode(.original)
                            .font(.system(size: 32))
                        Text(
                            String(
                                format: Constants.Texts.minTemperature,
                                round(data.temperatureMin)
                            )
                        )
                        Text(
                            String(
                                format: Constants.Texts.maxTemperature,
                                round(data.temperatureMax)
                            )
                        )
                    }
                    .frame(maxWidth: .infinity)
                    .forecastCardStyle()
                }
            }
        }
        .scrollIndicators(.hidden)
        .frame(maxHeight: 500)
        .forecastCardStyle()
    }
}

#Preview {
    DailyForecastView(dailyWeather: DailyWeather.mock)
}
