//
//  WeatherViewController.swift
//  test-weather-ios-app
//
//  Created by Nasty on 06.05.2022.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    var weatherManager = WeatherManager.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.onWeatherFetch = { (weather) -> Void in
            var emoji: String
            switch weather.main.temp {
            case 30...:
                emoji = "🔥"
            case 20...29:
                emoji = "☀️"
            case 15...19:
                emoji = "🌤"
            case 5...14:
                emoji = "🌥"
            case ...4:
                emoji = "❄️"
            default:
               emoji = "❓❓❓"
            }
            self.temperatureLabel.text = "\(weather.main.temp)℃"
            self.emojiLabel.text = emoji
            self.cityLabel.text = weather.name
        }
        
    }
}
