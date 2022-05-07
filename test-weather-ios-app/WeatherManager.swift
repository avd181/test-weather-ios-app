//
//  WeatherManager.swift
//  test-weather-ios-app
//
//  Created by Nasty on 06.05.2022.
//

import Foundation
import CoreLocation

class WeatherManager: NSObject, CLLocationManagerDelegate {
    
    private let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    private let locationManager = CLLocationManager()
    
    var onWeatherFetch: ((WeatherResponse) -> Void)?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func getTemperature(lat: Double, lon: Double) {
        let dataTask = urlSession.dataTask(
            with: URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=d63b9d13706d4df079f43fad58b11a5b&units=metric")!
        ) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                    print(weatherResponse.coord, weatherResponse.main.temp)
                    DispatchQueue.main.async {
                        self.onWeatherFetch?(weatherResponse)
                    }
                } catch {
                    print(error.localizedDescription)
                    print(error)
                }
            }
        }
        dataTask.resume()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       let lat = locations.first?.coordinate.latitude
        let lon = locations.first?.coordinate.longitude
        if let lat = lat, let lon = lon {
            getTemperature(lat: lat, lon: lon)
        }
        
    }
}
