//
//  NetworkManager.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import Foundation

struct NetworkManager: NetworkService {
    
    func requestData(for endPoint: EndPoint) async throws -> [Weather] {
        let response: [Weather] = try await fetchAndProcessData(from: endPoint.url)
        return response
    }
}

// MARK: - handleDecoding

private extension NetworkManager {
    
    func fetchAndProcessData<T: Decodable>(from url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        try handleResponseErrors(response)
        return try handleDecoding(from: data)
    }
}

// MARK: - handleDecoding

private extension NetworkManager {
    
    func handleDecoding<T: Decodable>(from data: Data) throws -> T {
        do {
            let decoder = JSONDecoder().decoder
            return try decoder.decode(
                T.self,
                from: data
            )
        } catch {
            throw NetworkError.decodingError
        }
    }
}

// MARK: - handleErrors

private extension NetworkManager {
    
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
}

// MARK: - decoder

private extension JSONDecoder {
    
    var decoder: JSONDecoder {
        self.keyDecodingStrategy = .convertFromSnakeCase
        self.dateDecodingStrategy = .secondsSince1970
        return self
    }
}
