//
//  Current.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import Foundation

struct Current: Decodable, Equatable {
    
    let time: Date
    let temperature2M: Double
    let apparentTemperature: Double
    let weatherCode: WeatherCode
    let windSpeed10M: Double
    let windDirection10M: Double
    let windGusts10M: Double
    let precipitation: Double
    let rain: Double
    let showers: Double
    let snowfall: Double
}
