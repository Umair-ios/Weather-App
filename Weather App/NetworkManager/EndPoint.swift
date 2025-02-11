//
//  EndPoint.swift
//  Weather App
//
//  Created by Umair on 02.02.25.
//

import Foundation

enum EndPoint {
    
    case fetchWeather(coordinates: [Coordinate])
}

// MARK: path

extension EndPoint {
    
    var path: String {
        switch self {
        case .fetchWeather:
            return "/v1/forecast"
        }
    }
    
}

// MARK: queryItems

extension EndPoint {
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .fetchWeather(let coordinates):
            let queryItems = Constants.QueryItems.self
            let queryValues = Constants.QueryValues.self
            
            let latitudeValues = coordinates.map { "\($0.latitude)" }.joined(separator: Constants.Separator.comma)
            let longitudeValues = coordinates.map { "\($0.longitude)" }.joined(separator: Constants.Separator.comma)
            
            return [
                URLQueryItem(
                    name: queryItems.latitude,
                    value: latitudeValues
                ),
                URLQueryItem(
                    name: queryItems.longitude,
                    value: longitudeValues
                ),
                URLQueryItem(
                    name: queryItems.current,
                    value: queryValues.current
                ),
                URLQueryItem(
                    name: queryItems.hourly,
                    value: queryValues.hourly
                ),
                URLQueryItem(
                    name: queryItems.daily,
                    value: queryValues.daily
                ),
                URLQueryItem(
                    name: queryItems.timeFormat,
                    value: queryValues.timeFormat
                ),
            ]
        }
    }
}

// MARK: url

extension EndPoint {
    
    var url: URL {
        get throws {
            var components = URLComponents()
            components.scheme = "https"
            components.host = Constants.API.baseURL
            components.path = path
            components.queryItems = queryItems
            
            guard let url = components.url else {
                throw NetworkError.invalidURL
            }
            
            return url
        }
    }
}
