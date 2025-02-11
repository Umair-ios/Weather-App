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
    
    enum Detail {
        
        case wind(Current)
        case precipitation(Current)
    }
}

extension Current.Detail {
    
    var desription: [String] {
        switch self {
        case .wind(let current):
            [
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
        case .precipitation(let current):
            [
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
        }
    }
}

#if DEBUG
extension Current {
    
    static var mock: Current {
        return .init(
            time: Date(),
            temperature2M: 22.5,
            apparentTemperature: 21.0,
            weatherCode: .depositingRimeFog,
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
