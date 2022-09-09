//
//  MaxMin.swift
//  Weather
//
//  Created by Charles Snider on 9/9/22.
//

import SwiftUI

struct MaxMin: View {
    
    var weather : ResponseBody
    
    var body: some View {
        HStack{
            
            Spacer()
            
            VStack(spacing: 20) {
                Image(systemName: "thermometer.snowflake")
                    .font(.system(size: 40))
                Text(weather.main.temp_min.roundDouble() + "°F")
            }
            
            Spacer()
            
            VStack(spacing: 20) {
                Image(systemName: "humidity.fill")
                    .font(.system(size: 40))
                Text(weather.main.humidity.roundDouble() + "%")
            }
            
            Spacer()
                                        
            VStack(spacing: 20) {
                Image(systemName: "thermometer.sun.fill")
                    .font(.system(size: 40))
                Text(weather.main.temp_max.roundDouble() + "°F")
            }
            
            Spacer()
        }
    }
}

struct MaxMin_Previews: PreviewProvider {
    static var previews: some View {
        MaxMin(weather: previewWeather)
    }
}
