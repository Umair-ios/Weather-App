//
//  ReusableViews+Modifiers.swift
//  Weather App
//
//  Created by Umair on 21.01.25.
//

import SwiftUI

// MARK: - BackgroundView

struct BackgroundView: View {
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    Color(Constants.Colors.gradientStart),
                    Color(Constants.Colors.gradientEnd)
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

// MARK: - LoadingView

struct LoadingView: View {
    
    var body: some View {
        Text(Constants.Texts.loadingWeather)
            .font(.subheadline)
            .forecastCardStyle()
    }
}

// MARK: - ForecastCardModifier

struct ForecastCardModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(10)
    }
}

extension View {
    
    func forecastCardStyle() -> some View {
        modifier(ForecastCardModifier())
    }
}
