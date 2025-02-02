//
//  NetworkError.swift
//  Weather App
//
//  Created by Umair on 02.02.25.
//

import Foundation

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
