//
//  WeatherDetailsView.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import SwiftUI

struct WeatherDetailsView: View {
    
    let current: Current
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Constants.Texts.others)
                .font(.title2)
            
            HStack {
                WeatherDetailSection(
                    headerTitle: Constants.Texts.wind,
                    headerImage: Constants.SystemImages.wind,
                    details: Current.Detail.wind(current).desription
                )
                
                Spacer()
                                
                WeatherDetailSection(
                    headerTitle: Constants.Texts.precipitation,
                    headerImage: Constants.SystemImages.cloudAndSnow,
                    details: Current.Detail.precipitation(current).desription
                )
            }
        }
        .forecastCardStyle()
    }
}

// MARK: - WeatherDetailSection

struct WeatherDetailSection: View {
    
    let headerTitle: String
    let headerImage: String
    let details: [String]
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 10
        ) {
            Label(
                headerTitle,
                systemImage: headerImage
            )
            .font(.headline)
            
            ForEach(details, id: \.self) { detail in
                Text(detail)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .forecastCardStyle()
    }
}

#Preview {
    WeatherDetailsView(current: Current.mock)
}
