//
//  SecondViewController.swift
//  CoordinatorPattern
//
//  Created by dreaMTank on 2024/01/27.
//

import UIKit

class SecondViewController: UIViewController , Coordinating{
    var coordinator: Coordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second"
        view.backgroundColor = .systemBlue
        
    }
}
