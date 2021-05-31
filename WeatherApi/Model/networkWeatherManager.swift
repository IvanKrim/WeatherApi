//
//  networkWeatherManager.swift
//  WeatherApi
//
//  Created by Kalabishka Ivan on 29.05.2021.
//

import Foundation



class NetworkWeatherManager { // передаем currentWeather во viewController
    
    var onCompletion: ((CurrentWeather) -> Void)?
    
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else { return }
        // вся работа с сетевыми запросами идет через сессию
        let session = URLSession(configuration: .default)
        // создаем запрос по url
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    self.onCompletion?(currentWeather)
                }
            }
        }
        // парсим данные через parseJSON и возвращаем currentWeather
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather? {
        // создаем декодер
        // let decoder = JSONDecoder()
        do {
            let currentWeatherData = try JSONDecoder().decode(CurrentWeatherData.self, from: data)
            // создаем объект
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else {
                return nil
            }
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}

