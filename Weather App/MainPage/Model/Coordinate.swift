//
//  Coordinate.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import Foundation

struct Coordinate: Equatable {
    
    let latitude: Double
    let longitude: Double
}

#if DEBUG
extension Coordinate {
    
    static var mock: Coordinate {
        return .init(
            latitude: 53.619653,
            longitude: 10.079969
        )
    }
}
#endif
