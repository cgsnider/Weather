//
//  SocialManager.swift
//  Weather
//
//  Created by Charles Snider on 9/11/22.
//

import Foundation
import CoreLocation

class SocialManager {
    
    func getSocial(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> SocialResponse {
        
        guard let url = URL(string:"https://oh4vzxwm3f.execute-api.us-east-2.amazonaws.com/Test/Weather") else {fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching social data") }
        
        let decodeData = try JSONDecoder().decode(SocialResponse.self, from: data)
                
        return decodeData
        
    }
    
    func postSocial(main: String, feelsLike: String){
        let url = URL(string: "https://oh4vzxwm3f.execute-api.us-east-2.amazonaws.com/Test/add?main=\(main)&feels_like=\(feelsLike)")
        guard let requestUrl = url else {fatalError()}
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        let postString = ""
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error Occured")
                return
            }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response:\n\(dataString)")
            }
            
        }
        
     }
    
}

struct SocialResponse: Decodable {
    let main: String
    let feels_like: Int
}

