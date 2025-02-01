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
        sut = WeatherViewModel(networkManager: mockNetworkService, timerInterval: 1)
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
        XCTAssertEqual(
            sut.currentLocation.latitude,
            Constants.Locations.coordinates[0].latitude
        )
        XCTAssertEqual(
            sut.currentLocation.longitude,
            Constants.Locations.coordinates[0].longitude
        )
    }
    
    func testGetHourlyAndDailyDataEmptyWeather() {
        // Given
        let hourlyData = sut.getHourlyForecastData()
        let dailyData = sut.getDailyForecastData()
        
        // Then
        XCTAssertTrue(hourlyData.isEmpty)
        XCTAssertTrue(dailyData.isEmpty)
    }
    
    // MARK: - Data Fetching Tests
    
    func testFetchWeatherDataSuccess() async throws {
        // Given
        let mockWeather = mockNetworkService.createMockWeather()
        mockNetworkService.stubbedResponse = [mockWeather]
        
        // When
        try await sut.fetchWeatherForecastData()
        
        // Then
        XCTAssertFalse(sut.weathers.isEmpty)
        XCTAssertEqual(sut.weathers.count, 1)
    }
    
    func testFetchWeatherDataMultipleLocations() async throws {
        // Given
        let mockWeathers = [
            mockNetworkService.createMockWeather(),
            mockNetworkService.createMockWeather(latitude: 52.0, longitude: 13.0)
        ]
        mockNetworkService.stubbedResponse = mockWeathers
        
        // When
        try await sut.fetchWeatherForecastData()
        
        // Then
        XCTAssertEqual(sut.weathers.count, 2)
        XCTAssertEqual(sut.weathers[1].latitude, 52.0)
    }
    
    func testGetHourlyAndDailyDataLoadedWeather() async throws {
        // Given
        let mockWeathers = [
            mockNetworkService.createMockWeather(),
            mockNetworkService.createMockWeather(latitude: 52.0, longitude: 13.0)
        ]
        mockNetworkService.stubbedResponse = mockWeathers
        
        // When
        try await sut.fetchWeatherForecastData()
        
        // Then
        XCTAssertFalse(sut.getHourlyForecastData().isEmpty)
        XCTAssertFalse(sut.getDailyForecastData().isEmpty)
        
    }
    
    // MARK: - Location Timer Tests
    @MainActor
    func testLocationTimerUpdatesLocation() async {
        // Given
        let initialLocation = sut.currentLocation
        let expectation = XCTestExpectation(description: "Location should update")
        
        // When
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Then
            XCTAssertNotEqual(self.sut.currentLocation.latitude, initialLocation.latitude)
            XCTAssertNotEqual(self.sut.currentLocation.longitude, initialLocation.longitude)
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 2)
    }
}
