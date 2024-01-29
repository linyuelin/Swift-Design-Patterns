//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by dreaMTank on 2024/01/27.
//

import Foundation
import UIKit

enum Event {
    case buttonTapped
}

protocol Coordinator {
    var navigationController: UINavigationController?{ get set }
    var children: [Coordinator]? {get set}
    func eventOccurred(with type: Event)
    func start()
}

protocol Coordinating{
    var coordinator: Coordinator? {get set}
}
