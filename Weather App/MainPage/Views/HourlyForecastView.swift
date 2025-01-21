//
//  HourlyForecastView.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import SwiftUI

struct HourlyForecastView: View {
    
    let hourlyWeather: [HourlyWeather]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Constants.Texts.hourlyReport)
                .font(.title2)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(hourlyWeather) { data in
                        VStack(spacing: 10) {
                            Text(
                                data.time,
                                style: .time
                            )
                            Image(systemName: data.icon)
                                .renderingMode(.original)
                                .font(.system(size: 46))
                            Text(
                                String(
                                    format: Constants.Texts.temperature,
                                    round(data.temperature)
                                )
                            )
                        }
                        .forecastCardStyle()
                    }
                }
            }
        }
        .forecastCardStyle()
    }
}
