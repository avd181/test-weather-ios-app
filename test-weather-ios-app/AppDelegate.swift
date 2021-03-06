//
//  AppDelegate.swift
//  test-weather-ios-app
//
//  Created by Nasty on 06.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = WeatherViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

