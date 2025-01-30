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

#if DEBUG
extension Current {
    static var mock: Current {
        return Current(
            time: Date(),
            temperature2M: 22.5,
            apparentTemperature: 21.0,
            weatherCode: .unknown,
            windSpeed10M: 5.0,
            windDirection10M: 180.0,
            windGusts10M: 10.0,
            precipitation: 0.0,
            rain: 0.0,
            showers: 0.0,
            snowfall: 0.0
        )
    }
}
#endif
