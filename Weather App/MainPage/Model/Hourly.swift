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
