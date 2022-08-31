//
//  WelcomeView.swift
//  Weather
//
//  Created by Charles Snider on 8/30/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager:
        LocationManager
    var body: some View {
        VStack {
            Text("Welcome to the weather App")
                .bold().font(.title)
                .multilineTextAlignment(.center)
            
            Text("Please share your current location to get the weather in your area")
                .multilineTextAlignment(.center)
                .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
