//
//  Temperature.swift
//  Weather
//
//  Created by Charles Snider on 9/9/22.
//

import SwiftUI

struct Temperature: View {
    
    var weather : ResponseBody
    
    var body: some View {
        HStack{
            VStack(spacing: 20) {
                Image(systemName: "cloud.fill")
                    .font(.system(size: 40))
                Text(weather.weather[0].main)
            }
            
                                        
            Text(weather.main.feels_like.roundDouble() + "°F").font(.system(size: 100))
                .fontWeight(.bold)
                .padding()
        }
    }
}

struct Temperature_Previews: PreviewProvider {
    static var previews: some View {
        Temperature(weather: previewWeather)
    }
}
