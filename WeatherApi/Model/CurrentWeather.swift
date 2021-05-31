//
//  CurrentWeather.swift
//  WeatherApi
//
//  Created by Kalabishka Ivan on 29.05.2021.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    let temperature: Double
    
    // форматируем в текстовый формат
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    let conditionCode: Int // необходим для обновления иконки
    var systemIconNameString: String {
        switch  conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.min.fill"
        case 801...804: return "cloud.fill"
        default: return "nosign"
        }
    }
    
    // создаем инициализатор который может вернуть nil
    // Благодаря этому мы сможем создать объект currentWeather
    // Заполняем все данными из JSON если что-то идет не так, то вернется nil
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
