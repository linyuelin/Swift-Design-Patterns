//
//  ViewController.swift
//  DI
//
//  Created by dreaMTank on 2024/01/30.
//
import APIKit
import MyAppUIKit
import UIKit

extension APICaller: DataFetchable{}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        view.addSubview(button)
        button.backgroundColor = .systemBlue
        button.setTitle("クリック", for: .normal)
        button.center = view.center
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
   
    @objc private func didTapButton() {
        let vc = CoursesViewController(dataFetchable: APICaller.shared )
        present(vc, animated: true)
    }

}

