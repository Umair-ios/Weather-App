//
//  WeatherViewModel.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import Foundation
import Combine

@Observable
class WeatherViewModel {
    
    private(set) var state: State = .loading
    private(set) var timer: AnyCancellable?
    private(set) var locationIndex: Int
    
    private let networkManager: NetworkService
    private let locations: [Coordinate]
    private let timerInterval: Double
    
    var currentLocation: Coordinate
    var weathers: [Weather]
    
    var currentWeather: Weather? {
        return weathers.isEmpty ? nil : weathers[locationIndex]
    }
    
    init(
        networkManager: NetworkService = NetworkManager(),
        locations: [Coordinate] = Constants.Locations.coordinates,
        locationIndex: Int = 1,
        currentLocation: Coordinate = Coordinate(
            latitude: 53.619653,
            longitude: 10.079969
        ),
        weathers: [Weather] = [],
        timerInterval: Double = 10
    ) {
        self.networkManager = networkManager
        self.locations = locations
        self.locationIndex = locationIndex
        self.currentLocation = currentLocation
        self.weathers = weathers
        self.timerInterval = timerInterval
        startLocationUpdateTimer()
    }
    
    func getHourlyForecastData() -> [HourlyWeather] {
        guard let weather = currentWeather?.hourly else {
            return []
        }
        
        return (0..<min(weather.time.count, 12)).map { index in
            HourlyWeather(
                time: weather.time[index],
                temperature: weather.temperature2M[index],
                icon: weather.weatherCode[index].icon
            )
        }
    }
    
    func getDailyForecastData() -> [DailyWeather] {
        guard let weather = currentWeather?.daily else {
            return []
        }
        
        return (
            0..<min(
                weather.time.count,
                weather.weatherCode.count,
                weather.temperature2MMax.count,
                weather.temperature2MMin.count
            )
        ).map { index in
            DailyWeather(
                time: weather.time[index],
                icon: weather.weatherCode[index].icon,
                temperatureMax: weather.temperature2MMax[index],
                temperatureMin: weather.temperature2MMin[index]
            )
        }
    }
    
    func fetchWeatherForecastData() async {
        do {
            state = .loading
            weathers = try await networkManager.requestData(for: .fetchWeather(coordinates: locations))
            state = .success(weathers)

        } catch (let error) {
            state = .failure(error)
        }
    }
    
    private func startLocationUpdateTimer() {
        timer = Timer.publish(
            every: timerInterval,
            on: .main,
            in: .common
        )
        .autoconnect()
        .sink { [weak self] _ in
            guard let self = self else { return }
            self.currentLocation = self.locations[self.locationIndex]
            self.locationIndex = (self.locationIndex + 1) % self.locations.count
        }
    }
}

// MARK: State

extension WeatherViewModel {
    
    typealias State = ContentViewState<[Weather]>
}
