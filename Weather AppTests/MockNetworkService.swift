//
//  MockNetworkService.swift
//  Weather App
//
//  Created by Umair on 31.01.25.
//

import XCTest
@testable import Weather_App

// MARK: - Mock Classes

class MockNetworkService: NetworkService {

    var stubbedResponse: [Weather] = []
    var shouldFail = false
    var mockError: Error?
    
    func requestData(for endPoint: EndPoint) async throws -> [Weather] {
        if shouldFail {
            throw mockError ?? NetworkError.unknown
        }
        return stubbedResponse
    }
    
}


// MARK: - Helper Methods

extension MockNetworkService {
    
    func createMockWeather(latitude: Double = 53.619653, longitude: Double = 10.079969) -> Weather {
        return Weather(
            latitude: latitude,
            longitude: longitude,
            current: Current(
                time: Date(),
                temperature2M: 20.0,
                apparentTemperature: 19.0,
                weatherCode: .clearSky,
                windSpeed10M: 10.0,
                windDirection10M: 180.0,
                windGusts10M: 15.0,
                precipitation: 0.0,
                rain: 0.0,
                showers: 0.0,
                snowfall: 0.0
            ),
            hourly: Hourly(
                time: Array(repeating: Date(), count: 24),
                temperature2M: Array(repeating: 20.0, count: 24),
                weatherCode: Array(repeating: WeatherCode.clearSky, count: 24)
            ),
            daily: Daily(
                time: Array(repeating: Date(), count: 7),
                weatherCode: Array(repeating: WeatherCode.clearSky, count: 7),
                temperature2MMax: Array(repeating: 25.0, count: 7),
                temperature2MMin: Array(repeating: 15.0, count: 7)
            )
        )
    }
}
