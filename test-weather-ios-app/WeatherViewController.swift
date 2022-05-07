//
//  WeatherViewController.swift
//  test-weather-ios-app
//
//  Created by Nasty on 06.05.2022.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        temperatureLabel.text = "+\(weatherManager.getTemperature())℃☀️"
    }
}
