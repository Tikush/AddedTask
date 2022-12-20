//
//  WeatherManager.swift
//  TikoJanikashvili - AddedTask
//
//  Created by Tiko Janikashvili on 20.12.22.
//

import Foundation

protocol WeatherManagerProtocol: AnyObject {
    func fetchWeather(cityName: String, completion: @escaping(Weather) -> Void)
}

class WeatherManager: WeatherManagerProtocol {
    
    func fetchWeather(cityName: String, completion: @escaping (Weather) -> Void) {
        
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=c6ea413e30e99d19320c7498c1f232ba"
        
        NetworkManager.shared.get(with: url) { (result: Result<Weather, Error>) in
            switch result {
            case .success(let weather):
                completion(weather)
            case .failure(let error):
                print(error)
            }
        }
    }
}
