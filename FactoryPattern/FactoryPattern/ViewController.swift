//
//  ViewController.swift
//  FactoryPattern
//
//  Created by dreaMTank on 2024/01/30.
//

import UIKit

class ViewController: UIViewController {

    private let factory = ScreenFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            let vc = self.factory.createSettinngsScreen(backgroundColor: .systemPink)
            self.present(vc,animated: true)
        })
                                      }

                                
}

