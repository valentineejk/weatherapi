//
//  Weather.swift
//  weatherapi
//
//  Created by valentineejk on 8/7/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
}
