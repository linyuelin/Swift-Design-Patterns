//
//  Models.swift
//  MVVMWeather
//
//  Created by dreaMTank on 2024/01/30.
//

import Foundation

//データ

struct WeatherModel: Codable {
    
    let timezone: String
    let current: CurrentWeather
}

struct CurrentWeather: Codable {
    let temp: Float
    let weather: [WeatherInfo]
}

struct WeatherInfo: Codable {
    let main: String
    let description: String
}
