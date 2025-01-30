//
//  WeatherViewModelTests.swift
//  Weather AppTests
//
//  Created by Umair on 21.01.25.
//

import XCTest
@testable import Weather_App

final class WeatherViewModelTests: XCTestCase {
    var sut: WeatherViewModel!
    var mockNetworkService: MockNetworkService!
    
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        sut = WeatherViewModel(networkManager: mockNetworkService)
    }
    
    override func tearDown() {
        sut = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    // MARK: - Initial State Tests
    
    func testInitialState() {
        XCTAssertTrue(sut.weathers.isEmpty)
        XCTAssertNil(sut.currentWeather)
        XCTAssertEqual(sut.currentLocation.latitude, 53.619653)
        XCTAssertEqual(sut.currentLocation.longitude, 10.079969)
    }
    
    func testInitialLocationIsFirstInList() {
        XCTAssertEqual(sut.currentLocation.latitude, Constants.Locations.coordinates[0].latitude)
        XCTAssertEqual(sut.currentLocation.longitude, Constants.Locations.coordinates[0].longitude)
    }
    
    // MARK: - Data Fetching Tests
    
    func testFetchWeatherDataSuccess() async throws {
        // Given
        let mockWeather = mockNetworkService.createMockWeather()
        mockNetworkService.mockWeathers = [mockWeather]
        
        // When
        try await sut.fetchWeatherForecastData()
        
        // Then
        XCTAssertFalse(sut.weathers.isEmpty)
        XCTAssertEqual(sut.weathers.count, 1)
    }
    
    func testFetchWeatherDataMultipleLocations() async throws {
        // Given
        let mockWeathers = [mockNetworkService.createMockWeather(), mockNetworkService.createMockWeather(latitude: 52.0, longitude: 13.0)]
        mockNetworkService.mockWeathers = mockWeathers
        
        // When
        try await sut.fetchWeatherForecastData()
        
        // Then
        XCTAssertEqual(sut.weathers.count, 2)
        XCTAssertEqual(sut.weathers[1].latitude, 52.0)
    }
    
    func testGetHourlyDataEmptyWeather() {
        // When
        let hourlyData = sut.getHourlyForecastData()
        
        // Then
        XCTAssertTrue(hourlyData.isEmpty)
    }
    
    func testGetDailyDataEmptyWeather() {
        // When
        let dailyData = sut.getDailyForecastData()
        
        // Then
        XCTAssertTrue(dailyData.isEmpty)
    }
    
    // MARK: - Location Timer Tests
    
    func testLocationTimerUpdatesLocation() async {
        // Given
        let expectation = XCTestExpectation(description: "Location should update")
        let initialLocation = sut.currentLocation
        
        // When
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 11) {
            // Then
            XCTAssertNotEqual(self.sut.currentLocation.latitude, initialLocation.latitude)
            XCTAssertNotEqual(self.sut.currentLocation.longitude, initialLocation.longitude)
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 12)
    }
}

// MARK: - Mock Classes

class MockNetworkService: NetworkService {
    var mockWeathers: [Weather] = []
    var shouldFail = false
    var mockError: Error?
    
    func fetchWeather(for coordinates: [Coordinate]) async throws -> [Weather] {
        if shouldFail {
            throw mockError ?? NetworkError.unknown
        }
        return mockWeathers
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

