//
//  ScreenFactory.swift
//  FactoryPattern
//
//  Created by dreaMTank on 2024/01/30.
//

import Foundation
import UIKit

protocol ScreenFactoryProtocol{
    func createSettinngsScreen(backgroundColor: UIColor) -> UIViewController
}

final class ScreenFactory : ScreenFactoryProtocol{
    
    init() {}
    
    func createSettinngsScreen(backgroundColor: UIColor) -> UIViewController {
        let settingsVC = UIViewController()
        settingsVC.view.backgroundColor = backgroundColor
        return settingsVC
    }
}
