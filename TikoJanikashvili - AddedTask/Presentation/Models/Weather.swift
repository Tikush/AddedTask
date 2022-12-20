//
//  Weather.swift
//  TikoJanikashvili - AddedTask
//
//  Created by Tiko Janikashvili on 20.12.22.
//

import Foundation

struct Weather: Codable {
    let name: String?
    let weather: [WeatherCodable]
    let wind: Wind
    
    struct WeatherCodable: Codable {
        let main: String?
        let description: String?
    }
    
    struct Wind: Codable {
        let speed: Double?
    }
}
