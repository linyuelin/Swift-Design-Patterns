//
//  CoordinatorPattern.swift
//  CoordinatorPattern
//
//  Created by dreaMTank on 2024/01/27.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    var children: [Coordinator]? = nil
    
    func eventOccurred(with type: Event) {
        switch type {
        case .buttonTapped:
            //SecondViewControllerインスタンスを作成する
            var vc: UIViewController & Coordinating = SecondViewController()
            //コーディネータを設定する
            vc.coordinator = self
            //画面遷移
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        
        
      // ビューコントローラインスタンス作成し、二つのプロトコルを遵守する
        
      var vc :UIViewController & Coordinating =  ViewController()
    //　ビューの　コーディネータを設定し
        vc.coordinator = self
        
      // ビューをナビのルートにする
        navigationController?.setViewControllers([vc], animated: false)
    }
    
  
    
    
    
}
