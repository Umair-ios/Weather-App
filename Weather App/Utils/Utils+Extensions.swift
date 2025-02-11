//
//  Utils+Extensions.swift
//  Weather App
//
//  Created by Umair on 09.02.25.
//

import Foundation

// MARK: ContentViewStateProtocol

protocol ContentViewStateProtocol {

    associatedtype Output

    var state: ContentViewState<Output> { get }
}

// MARK: ContentViewState

enum ContentViewState<Value> {
    
    case loading
    case success(Value)
    case failure(Error)
}

// MARK: - decoder

extension JSONDecoder {
    
    var decoder: JSONDecoder {
        self.keyDecodingStrategy = .convertFromSnakeCase
        self.dateDecodingStrategy = .secondsSince1970
        return self
    }
}
