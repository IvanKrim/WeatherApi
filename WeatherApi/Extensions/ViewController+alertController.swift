//
//  ViewController+alertController.swift
//  WeatherApi
//
//  Created by Kalabishka Ivan on 29.05.2021.
//

import UIKit

extension ViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        // completionHandler: (String) -> Void) кложер который позволяет передавать название города
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField { textField in
            let cities = ["San Francisco", "Moscow", "New York", "Stambul", "Viena"]
            // плейсхолдер для поисковика
            textField.placeholder = cities.randomElement()
        }
        // кнопка serach в алертконтроллере
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = alertController.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                // если город состоит из двух слов необходимо два слова соединить
                // указываем что у нас будет два слова разделенные пробелом и соединяем вместе
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        // кнопка cancel
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(search)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
}
