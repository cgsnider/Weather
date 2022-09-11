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
        
        /* TODO: Need to add weather icons for other weather conditions.
            Other weather conditions include Thunderstorm, Drizzle, Rain, Snow, Clear
         */
        
        if (social.main == "Clouds") {
            return "cloud.fill"
        } else {
            return "sun.min"
        }
    }
    
    var body: some View {
        HStack{
            VStack(spacing: 20) {
                Image(systemName: selectImg())
                    .font(.system(size: 40))
                Text("Social")
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
