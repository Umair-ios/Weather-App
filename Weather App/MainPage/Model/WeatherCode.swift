//
//  WeatherCode.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import Foundation

enum WeatherCode: Int, Decodable {
    
    case clearSky = 0
    case mainlyClear = 1
    case partlyCloudy = 2
    case overcast = 3
    case fog = 45
    case depositingRimeFog = 48
    case drizzleLight = 51
    case drizzleModerate = 53
    case drizzleDense = 55
    case freezingDrizzleLight = 56
    case freezingDrizzleDense = 57
    case rainSlight = 61
    case rainModerate = 63
    case rainHeavy = 65
    case freezingRainLight = 66
    case freezingRainHeavy = 67
    case snowSlight = 71
    case snowModerate = 73
    case snowHeavy = 75
    case snowGrains = 77
    case rainShowersSlight = 80
    case rainShowersModerate = 81
    case rainShowersViolent = 82
    case snowShowersSlight = 85
    case snowShowersHeavy = 86
    case thunderstormSlight = 95
    case thunderstormWithHailSlight = 96
    case thunderstormWithHailHeavy = 99
}

// MARK: description

extension WeatherCode {
    
    var description: String {
        switch self {
        case .clearSky: return "Clear sky"
        case .mainlyClear, .partlyCloudy, .overcast: return "Mainly clear, partly cloudy, or overcast"
        case .fog, .depositingRimeFog: return "Fog or depositing rime fog"
        case .drizzleLight, .drizzleModerate, .drizzleDense: return "Drizzle"
        case .freezingDrizzleLight, .freezingDrizzleDense: return "Freezing drizzle"
        case .rainSlight, .rainModerate, .rainHeavy: return "Rain"
        case .freezingRainLight, .freezingRainHeavy: return "Freezing rain"
        case .snowSlight, .snowModerate, .snowHeavy: return "Snowfall"
        case .snowGrains: return "Snow grains"
        case .rainShowersSlight, .rainShowersModerate, .rainShowersViolent: return "Rain showers"
        case .snowShowersSlight, .snowShowersHeavy: return "Snow showers"
        case .thunderstormSlight: return "Thunderstorm"
        case .thunderstormWithHailSlight, .thunderstormWithHailHeavy: return "Thunderstorm with hail"
        }
    }
}

// MARK: icon

extension WeatherCode {
    
    var icon: String {
        switch self {
        case .clearSky: return "sun.max.fill"
        case .mainlyClear, .partlyCloudy, .overcast: return "cloud.sun.fill"
        case .fog, .depositingRimeFog: return "cloud.fog.fill"
        case .drizzleLight, .drizzleModerate, .drizzleDense: return "cloud.drizzle.fill"
        case .freezingDrizzleLight, .freezingDrizzleDense: return "cloud.sleet.fill"
        case .rainSlight, .rainModerate, .rainHeavy: return "cloud.rain.fill"
        case .freezingRainLight, .freezingRainHeavy: return "cloud.sleet.fill"
        case .snowSlight, .snowModerate, .snowHeavy: return "cloud.snow.fill"
        case .snowGrains: return "snowflake"
        case .rainShowersSlight, .rainShowersModerate, .rainShowersViolent: return "cloud.sun.rain.fill"
        case .snowShowersSlight, .snowShowersHeavy: return "cloud.snow.fill"
        case .thunderstormSlight: return "cloud.bolt.fill"
        case .thunderstormWithHailSlight, .thunderstormWithHailHeavy: return "cloud.bolt.rain.fill"
        }
    }
}
