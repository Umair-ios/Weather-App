//
//  Constants.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import Foundation

struct Constants {
    
    // MARK: - Colors

    struct Colors {
        
        static let gradientStart = "GradientStart"
        static let gradientEnd = "GradientEnd"
    }
    
    // MARK: - Texts

    struct Texts {
        
        static let loadingWeather = "Loading weather..."
        static let dismiss = "Dismiss"
        static let coordinates = "lat: %.2f, long: %.2f"
        static let temperature = "%.0f°C"
        static let feelsLike = "Feels like: %.0f°C"
        static let hourlyReport = "Hourly Report"
        static let dailyReport = "Daily Report"
        static let minTemperature = "Min: %.0f°C"
        static let maxTemperature = "Max: %.0f°C"
        static let others = "Others"
        static let wind = "Wind"
        static let windSpeed = "Speed: %.0f km/h"
        static let windDirection = "Direction: %.0f °"
        static let windGusts = "Gusts: %.0f km/h"
        static let precipitation = "Precipitation"
        static let rain = "Rain: %.0f mm"
        static let shower = "Shower: %.0f mm"
        static let snowfall = "Snow: %.0f cm"
    }
    
    // MARK: - API

    struct API {
        
        static let baseURL = "https://api.open-meteo.com/v1/forecast"
    }
    
    // MARK: - QueryItems
    
    struct QueryItems {
        
        static let latitude = "latitude"
        static let longitude = "longitude"
        static let current = "current"
        static let hourly = "hourly"
        static let daily = "daily"
        static let timeFormat = "timeformat"
    }
    
    // MARK: - QueryValues
    
    struct QueryValues {
        
        static let current = "temperature_2m,apparent_temperature,precipitation,rain,showers,snowfall,weather_code,wind_speed_10m,wind_direction_10m,wind_gusts_10m"
        static let hourly = "temperature_2m,weather_code"
        static let daily = "weather_code,temperature_2m_max,temperature_2m_min"
        static let timeFormat = "unixtime"
    }
    
    // MARK: - Errors
    
    struct Errors {
        
        static let invalidURL = "The URL provided is invalid. Please check and try again."
        static let invalidResponse = "The server response was invalid. Please try again later."
        static let decodingError = "There was an error processing the data. Please try again."
        static let unknown = "An unknown error occurred. Please try again or contact support."
    }
    
    // MARK: - SystemImage
    
    struct SystemImages {
        
        static let cloudAndSnow = "cloud.snow.fill"
        static let wind = "wind"
    }
    
    // MARK: - Separator
    
    struct Separator {
        
        static let comma = ","
    }
    
    // MARK: - Locations
    
    struct Locations {
        
        static let coordinates = [
            Coordinate(
                latitude: 53.619653,
                longitude: 10.079969
            ),
            Coordinate(
                latitude: 53.080917,
                longitude: 8.847533
            ),
            Coordinate(
                latitude: 52.378385,
                longitude: 9.794862
            ),
            Coordinate(
                latitude: 52.496385,
                longitude: 13.444041
            ),
            Coordinate(
                latitude: 53.866865,
                longitude: 10.739542
            ),
            Coordinate(
                latitude: 54.304540,
                longitude: 10.152741
            ),
            Coordinate(
                latitude: 54.797277,
                longitude: 9.491039
            ),
            Coordinate(
                latitude: 52.426412,
                longitude: 10.821392
            ),
            Coordinate(
                latitude: 53.542788,
                longitude: 8.613462
            ),
            Coordinate(
                latitude: 53.141598,
                longitude: 8.242565
            )
        ]
    }
}
