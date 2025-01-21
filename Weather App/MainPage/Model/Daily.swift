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
