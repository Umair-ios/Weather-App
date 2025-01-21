//
//  NetworkManager.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import Foundation

struct NetworkManager: NetworkService {
    
    let baseURL = Constants.API.baseURL
    
    func fetchWeather(for coordinates: [Coordinate]) async throws -> [Weather] {
        guard let url = addQueryItems(coordinates: coordinates)?.url else {
            throw NetworkError.invalidURL
        }
        let response: [Weather] = try await fetchAndProcessData(from: url)
        return response
    }
}

// MARK: - Helping methods for NetworkManager

private extension NetworkManager {
    
    func addQueryItems(coordinates: [Coordinate]) -> URLComponents? {
        var components = URLComponents(string: baseURL)
        
        let queryItems = Constants.QueryItems.self
        let queryValues = Constants.QueryValues.self
        let latitudeValues = coordinates.map { "\($0.latitude)" }.joined(separator: Constants.Separator.comma)
        let longitudeValues = coordinates.map { "\($0.longitude)" }.joined(separator: Constants.Separator.comma)
        
        components?.queryItems = [
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
        return components
    }
    
    func fetchAndProcessData<T: Decodable>(from url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        try handleResponseErrors(response)
        return try handleDecoding(from: data)
    }
    
    func handleResponseErrors(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return
        default:
            throw NetworkError.unknown
        }
    }
    
    func handleDecoding<T: Decodable>(from data: Data) throws -> T {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .secondsSince1970
            return try decoder.decode(
                T.self,
                from: data
            )
        } catch {
            throw NetworkError.decodingError
        }
    }
}

// MARK: - NetworkError

enum NetworkError: LocalizedError {
    
    case invalidURL
    case invalidResponse
    case decodingError
    case unknown
}

// MARK: errorMessage

extension NetworkError {
    
    var errorMessage: String {
        switch self {
        case .invalidURL:
            return Constants.Errors.invalidURL
        case .invalidResponse:
            return Constants.Errors.invalidResponse
        case .decodingError:
            return Constants.Errors.decodingError
        case .unknown:
            return Constants.Errors.unknown
        }
    }
}
