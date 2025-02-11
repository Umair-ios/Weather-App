//
//  ErrorView.swift
//  Weather App
//
//  Created by Umair on 09.02.25.
//

import SwiftUI

struct ErrorView: View {
    
    let message: String
    let retry: () async -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: Constants.SystemImages.error)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
            
            Text(message)
                .font(.headline)
                .padding()
            
            Button(action: {
                Task {
                    await retry()
                }
            }) {
                Text(Constants.Texts.retry)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
        }
    }
}

#Preview {
    ErrorView(message: "No Internet") {}
}
