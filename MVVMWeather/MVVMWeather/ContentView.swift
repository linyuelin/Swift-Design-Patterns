//
//  ContentView.swift
//  MVVMWeather
//
//  Created by dreaMTank on 2024/01/30.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.timezone)
                    .font(.system(size: 32))
                Text(viewModel.temp)
                    .font(.system(size: 44))
                Text(viewModel.title)
                    .font(.system(size: 24))
                Text(viewModel.descriptionText)
                    .font(.system(size: 24))
            }
            .navigationTitle("Weather MVVM")
        }
    }
}

#Preview {
    ContentView()
}
