//
//  WeatherViewController.swift
//  TikoJanikashvili - AddedTask
//
//  Created by Tiko Janikashvili on 19.12.22.
//

import UIKit

class WeatherViewController: UIViewController {
    
    // MARK: Private IBOutlets
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var weatherMainLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var windSpeedLabel: UILabel!
    
    // MARK: Private Properties
    private var weatherManager: WeatherManagerProtocol!
    
    // MARK: Internal Properties
    var name: String?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
    }
    
    // MARK: Functions
    private func getWeather() {
        weatherManager = WeatherManager()
            
        weatherManager.fetchWeather(cityName: name ?? "") { [weak self] weather in
            
            DispatchQueue.main.async {
                self?.cityNameLabel.text = weather.name
                weather.weather.forEach { self?.weatherMainLabel.text = $0.main }
                weather.weather.forEach { self?.descriptionLabel.text = $0.description }
                self?.windSpeedLabel.text = "\(weather.wind.speed ?? 0)"
            }
        }
    }
}
