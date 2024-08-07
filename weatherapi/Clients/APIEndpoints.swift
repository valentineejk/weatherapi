//
//  APIEndpoints.swift
//  weatherapi
//
//  Created by valentineejk on 8/7/24.
//

import Foundation



enum APIEndpoints {
    
    static let baseUrl = "https://api.openweathermap.org"
    
    case cordinatesByCityName(String)
    case weatherByLatLon(Double, Double)
    
    private var path: String {
        switch self {
        case .cordinatesByCityName(let city):
            return "/geo/1.0/direct?q=\(city)&appid=\(Constants.Keys.weatherAPIKey)"
        case .weatherByLatLon(let lat, let lon):
            return "/data/2.5/weather?lat=\(lat)&lon=\(lon)0&appid=\(Constants.Keys.weatherAPIKey)"
        }
    }
    
    static func endpointURL(for endpoint: APIEndpoints) -> URL{
        let endpointPath = endpoint.path
        return URL(string: baseUrl + endpointPath)!
    }
}
