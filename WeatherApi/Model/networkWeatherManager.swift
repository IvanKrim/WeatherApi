//
//  networkWeatherManager.swift
//  WeatherApi
//
//  Created by Kalabishka Ivan on 29.05.2021.
//

import Foundation
struct NetworkWeatherManager {
    func fetchCurrentWeather(for city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        // вся работа с сетевыми запросами идет через сессию
        let session = URLSession(configuration: .default)
        // создаем запрос по url
        session.dataTask(with: url) { data, response, error in
            
            if let data = data {
                let dataString = String(data: data, encoding: .utf8)
                print("This is Data: \(dataString ?? "data is empty")")
            } else {
                print("This is error: \(error?.localizedDescription ?? "No error description")")
            }
        } .resume()
    }
}
