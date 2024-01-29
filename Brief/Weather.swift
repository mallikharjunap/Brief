//
//  Weather.swift
//  Brief
//
//  Created by Apple on 29/01/24.
//

import Foundation


struct Weather:Decodable {
    
        let main: Main
        let weather: [WeatherInfo]

        struct Main: Decodable {
            let temp: Double
        }

        struct WeatherInfo: Decodable {
            let description: String
        }
}
