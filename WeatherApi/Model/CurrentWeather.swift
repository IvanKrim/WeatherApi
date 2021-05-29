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
        return "\(temperature.rounded())"
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return "\(feelsLikeTemperature.rounded())"
    }
    
    let conditionCode: Int // необходим для обновления иконки
    
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
