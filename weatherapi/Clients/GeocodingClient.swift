//
//  GeocodingClient.swift
//  weatherapi
//
//  Created by valentineejk on 8/7/24.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
}

struct GeocodingClient {
    
    func coordinateByCity(_ city: String) async throws -> Location? {

        
        let (data, response) = try await URLSession.shared.data(from: APIEndpoints.endpointURL(for: .cordinatesByCityName(city)))
        
        
        //response
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        //decode reponse
        let locations = try JSONDecoder().decode([Location].self, from: data)
        return locations.first
        
    }
    
    
}
