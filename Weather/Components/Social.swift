//
//  Temperature.swift
//  Weather
//
//  Created by Charles Snider on 9/9/22.
//

import SwiftUI

struct Social: View {
    
    var social: SocialResponse
    
    func selectImg() -> String{
        
        if (social.main == "Clouds") {
            return "cloud.fill"
            
        } else  if (social.main == "Thunderstorm") {
            return "cloud.bolt.rain"
            
        } else  if (social.main == "Drizzle") {
            return "cloud.drizzle"
        
        } else  if (social.main == "Rain") {
            return "cloud.rain"
        
        } else  if (social.main == "Snow") {
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
                Text("social.main")
            }
                                        
            Text(String(social.feels_like) + "°F").font(.system(size: 100))
                .fontWeight(.bold)
                .padding()
        }
    }
}

struct Social_Previews: PreviewProvider {
    static var previews: some View {
        Social(social: previewSocial)
    }
}
