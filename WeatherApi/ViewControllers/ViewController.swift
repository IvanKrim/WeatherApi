//
//  ViewController.swift
//  WeatherApi
//
//  Created by Kalabishka Ivan on 29.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var weatherIconImageView: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var feelsLikeTemperature: UILabel!
    
    // создаем экземпляр менеджера
    var networkWeatherManager = NetworkWeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkWeatherManager.fetchCurrentWeather(for: "Voronezh")
        
        
    }
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { city in
            self.networkWeatherManager.fetchCurrentWeather(for: city)
        }
    }
    
}

