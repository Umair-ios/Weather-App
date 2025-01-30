//
//  Hourly.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import Foundation

struct Hourly: Decodable, Equatable {
    
    let time: [Date]
    let temperature2M: [Double]
    let weatherCode: [WeatherCode]
}

// MARK: - HourlyWeather

struct HourlyWeather: Identifiable {
    
    let id = UUID()
    let time: Date
    let temperature: Double
    let icon: String
}

#if DEBUG
extension Hourly {
    static var mock: Hourly {
        return Hourly(
            time: Array(repeating: Date(), count: 24),
            temperature2M: Array(repeating: 22.5, count: 24),
            weatherCode: Array(repeating: .clearSky, count: 24)
        )
    }
}

#endif
