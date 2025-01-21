//
//  ModelTests.swift
//  Weather AppTests
//
//  Created by Umair on 21.01.25.
//

import XCTest
@testable import Weather_App

final class ModelTests: XCTestCase {
    
    // MARK: - Current Tests
    
    func testCurrentEquatable() {
        // Given
        let current1 = Current(
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
        )
        
        let current2 = Current(
            time: current1.time,
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
        )
        
        // Then
        XCTAssertEqual(current1, current2)
    }
    
    // MARK: - Coordinate Tests
    
    func testCoordinateCreation() {
        // Given
        let latitude = 53.619653
        let longitude = 10.079969
        
        // When
        let coordinate = Coordinate(latitude: latitude, longitude: longitude)
        
        // Then
        XCTAssertEqual(coordinate.latitude, latitude)
        XCTAssertEqual(coordinate.longitude, longitude)
    }
    
    // MARK: - NetworkError Tests
    
    func testNetworkErrorMessage() {
        // Given
        let testCases: [(NetworkError, String)] = [
            (.invalidURL, Constants.Errors.invalidURL),
            (.invalidResponse, Constants.Errors.invalidResponse),
            (.decodingError, Constants.Errors.decodingError),
            (.unknown, Constants.Errors.unknown)
        ]
        
        // When/Then
        for (error, expectedMessage) in testCases {
            XCTAssertEqual(error.errorMessage, expectedMessage)
        }
    }
    
    func testWeatherCodeDescription() {
        // Given
        let testCases: [(WeatherCode, String)] = [
            (.clearSky, "Clear sky"),
            (.mainlyClear, "Mainly clear, partly cloudy, or overcast"),
            (.fog, "Fog or depositing rime fog"),
            (.drizzleLight, "Drizzle"),
            (.thunderstormWithHailHeavy, "Thunderstorm with hail")
        ]
        
        // When/Then
        for (code, expectedDescription) in testCases {
            XCTAssertEqual(code.description, expectedDescription)
        }
    }

    func testWeatherCodeIcon() {
        // Given
        let testCases: [(WeatherCode, String)] = [
            (.clearSky, "sun.max.fill"),
            (.mainlyClear, "cloud.sun.fill"),
            (.fog, "cloud.fog.fill"),
            (.drizzleLight, "cloud.drizzle.fill"),
            (.thunderstormWithHailHeavy, "cloud.bolt.rain.fill")
        ]
        
        // When/Then
        for (code, expectedIcon) in testCases {
            XCTAssertEqual(code.icon, expectedIcon)
        }
    }
}

