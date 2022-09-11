//
//  WeatherView.swift
//  Weather
//
//  Created by Charles Snider on 9/9/22.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var social: SocialResponse
    
    @State var curr : String
    @State var uploadflag = true

    
    var body: some View {
        
        
        ZStack(alignment: .leading) {
            

            
            VStack {
                VStack(alignment: .center, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                
                Spacer()
                
                
                VStack {
                    HStack (){
                        if (curr == "temp") {
                            Temperature(weather: weather)
                        } else if (curr == "maxmin") {
                            MaxMin(weather: weather)
                        } else if (curr == "social") {
                            Social(social: social)
                        }
                    }
                    .frame(width: .infinity, height: 100, alignment: .center)
                
                    Spacer()
                        .frame(height: 80)
                    
                    Image("atl_skyline")
                        .resizable()
                        .frame(width: 400, height: 300, alignment: .center)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.527, saturation: 0.912, brightness: 0.21))
        .preferredColorScheme(.dark)
        .onTapGesture {
           changeCurrent()
        }
    }
    
    func changeCurrent() {
        if (curr == "temp") {
            curr = "maxmin"
        } else if (curr == "maxmin") {
            curr = "social"
        } else if (curr == "social") {
            curr = "temp"
            if (uploadflag) {
                SocialManager().postSocial(main: weather.weather[0].main, feelsLike: weather.main.feels_like.roundDouble())
                uploadflag = false
            }
        }
        
    }
    
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather, social: previewSocial, curr: "maxmin")
    }
}

