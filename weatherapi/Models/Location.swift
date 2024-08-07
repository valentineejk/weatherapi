//
//  Location.swift
//  weatherapi
//
//  Created by valentineejk on 8/7/24.
//

import Foundation

// MARK: - WeatherAPIElement
struct Location: Decodable {
    let name: String
    let lat, lon: Double
    let country, state: String
}
