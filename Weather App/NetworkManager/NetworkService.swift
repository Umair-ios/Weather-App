//
//  NetworkService.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import Foundation

protocol NetworkService {
    
    func requestData(for endPoint: EndPoint) async throws -> [Weather]
}
