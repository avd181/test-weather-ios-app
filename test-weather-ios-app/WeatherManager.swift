//
//  WeatherManager.swift
//  test-weather-ios-app
//
//  Created by Nasty on 06.05.2022.
//

import Foundation

class WeatherManager {
    var urlSession = URLSession(configuration: URLSessionConfiguration.default)
    
    func getTemperature() -> Double {
        let dataTask = urlSession.dataTask(
            with: URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=30&lon=30&appid=d63b9d13706d4df079f43fad58b11a5b")!
        ) { data, response, error in
            if let data = data {
                let string = String(data: data, encoding: .utf8)
                print(string)
            }
        }
        dataTask.resume()
        return 38.5
    }
    
    func funcNew(number: Int?) {
        if number != nil {
            type(of: numbe)
        }
    }
}
