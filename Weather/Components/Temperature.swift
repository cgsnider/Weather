//
//  Temperature.swift
//  Weather
//
//  Created by Charles Snider on 9/9/22.
//

import SwiftUI

struct Temperature: View {
    
    
    var weather : ResponseBody
    
    func selectImg() -> String{
        
        /* Icons for weather conditions: Thunderstorm, Drizzle, Rain, Snow, Clear
         */
        
        if (weather.weather[0].main == "Clouds") {
            return "cloud.fill"
            
        } else  if (weather.weather[0].main == "Thunderstorm") {
            return "cloud.bolt.rain"
            
        } else  if (weather.weather[0].main == "Drizzle") {
            return "cloud.drizzle"
        
        } else  if (weather.weather[0].main == "Rain") {
            return "cloud.rain"
        
        } else  if (weather.weather[0].main == "Snow") {
            return "cloud.snow"
        
        } else  {
            return "sun.min"
        }
    }
    
    var body: some View {
        HStack{
            VStack(spacing: 20) {
                Image(systemName: selectImg())
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
