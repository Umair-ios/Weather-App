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
        let errorType = Constants.Errors.self
        
        switch self {
        case .invalidURL:
            return errorType.invalidURL
        case .invalidResponse:
            return errorType.invalidResponse
        case .decodingError:
            return errorType.decodingError
        case .unknown:
            return errorType.unknown
        }
    }
}
