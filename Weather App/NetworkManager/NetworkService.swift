//
//  NetworkService.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import Foundation

protocol NetworkService {
    
    func fetchWeather(for coordinates: [Coordinate]) async throws -> [Weather]
}
