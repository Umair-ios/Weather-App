//
//  Weather.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import Foundation

struct Weather: Decodable {
    
    let latitude: Double
    let longitude: Double
    let current: Current
    let hourly: Hourly
    let daily: Daily
}

// MARK: Equatable

extension Weather: Equatable {
    
    static func == (
        lhs: Weather,
        rhs: Weather
    ) -> Bool {
        return lhs.latitude == rhs.latitude &&
        lhs.longitude == rhs.longitude &&
        lhs.current == rhs.current &&
        lhs.hourly == rhs.hourly &&
        lhs.daily == rhs.daily
    }
}

#if DEBUG
extension Weather {
    
    static var mock: [Weather] {
        return Array(repeating: Weather(
            latitude: 37.7749,   
            longitude: -122.4194,
            current: .mock,
            hourly: .mock,
            daily: .mock
        ), count: 10)
    }
}

#endif
