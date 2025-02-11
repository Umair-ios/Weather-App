//
//  Daily.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import Foundation

struct Daily: Decodable, Equatable {
    
    let time: [Date]
    let weatherCode: [WeatherCode]
    let temperature2MMax: [Double]
    let temperature2MMin: [Double]
}

// MARK: - DailyWeather

struct DailyWeather: Identifiable {
    
    let id = UUID()
    let time: Date
    let icon: String
    let temperatureMax: Double
    let temperatureMin: Double
}

#if DEBUG
extension Daily {
    
    static var mock: Daily {
        return Daily(
            time: Array(repeating: Date(), count: 7),
            weatherCode: Array(repeating: .clearSky, count: 7),
            temperature2MMax: Array(repeating: 15.0, count: 7),
            temperature2MMin: Array(repeating: 25.0, count: 7)
        )
    }
}

extension DailyWeather {
    
    static var mock: [DailyWeather] {
        return Array(repeating: DailyWeather(
            time: Date(),
            icon: WeatherCode.clearSky.icon,
            temperatureMax: 15.0,
            temperatureMin: 25.0
        ), count: 7)
    }
}
#endif
