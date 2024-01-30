//
//  ViewModel.swift
//  MVVMWeather
//
//  Created by dreaMTank on 2024/01/30.
//

import Foundation

// ビューが必要とするデータ

class WeatherViewModel: ObservableObject {
   @Published var title: String = "_"
   @Published var descriptionText: String = "_"
   @Published var temp: String = "_"
   @Published var timezone: String = "_"
    
    init() {
        fetchWeather()
    }
    
    func  fetchWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?exclude=hourly,daily,minutely&lat=40 .7128&lon=-74&units=imperial&appid=a25ffc3abde70c25f3d7f331151a9e3f") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            
            // データをモデルに変換
            
            do {
                let model = try JSONDecoder().decode(WeatherModel.self,from: data)
                
                DispatchQueue.main.async {
                    self.title = model.current.weather.first?.main ?? "タイトルなし"
                    self.descriptionText = model.current.weather.first?.description ?? "ディスクリプタなし "
                    self.temp = "\(model.current.temp)"
                    self.timezone = model.timezone
                }
            }
            
            catch {
                print("failed")
            }
        }
        task.resume()
                            
    }
}
