//
//  ContentView.swift
//  weatherapi
//
//  Created by valentineejk on 8/7/24.
//

import SwiftUI

struct ContentView: View {
    
       let geocodingClient = GeocodingClient()
       let weatherClient = WeatherClient()
       @State private var city: String = ""
       @State private var isLoading: Bool = false
       @State private var weather: Weather?

    private func fetchWeather() async {
        do {
            guard let location = try await geocodingClient.coordinateByCity(city) else {
                return
            }
            weather = try await weatherClient.fecthWeather(location: location)
        } catch {
            print("error: \(error)")
        }
    }
    
    var body: some View {
        VStack {
            
            //text
       TextField("City", text: $city)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    isLoading = true
                }.task(id: isLoading) {
                    if isLoading {
                        await fetchWeather()
                        isLoading = false
                        city = ""
                    }
                }
            Spacer()

            //weather
            if let weather {
                Text(MeasurementFormatter.temperature(value: weather.temp))
                    .foregroundStyle(.black)
                    .font(.subheadline)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
