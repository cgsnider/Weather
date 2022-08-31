//
//  ContentView.swift
//  Weather
//
//  Created by Charles Snider on 8/30/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        VStack {
            if let location = locationManager.location {
                
                Text("Your coordinates are: \(location.longitude), \(location.latitude)")
                
            } else if locationManager.isLoading {
                
                LoadingView()
                
            }else {
                
                WelcomeView()
                    .environmentObject(locationManager)
                
            }
        }
        .background(Color(hue: 0.527, saturation: 0.912, brightness: 0.21))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
