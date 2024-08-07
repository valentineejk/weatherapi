//
//  WeatherClient.swift
//  weatherapi
//
//  Created by valentineejk on 8/7/24.
//

import Foundation

struct WeatherClient {
    
    func fecthWeather(location: Location) async throws -> Weather {
        
        let (data, response) = try await URLSession.shared.data(from: APIEndpoints.endpointURL(for: .weatherByLatLon(location.lat, location.lon)))

        
        //response
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        //decode reponse
        let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weather.main
    }
    
}
