//
//  Models.swift
//  MVVMExample
//
//  Created by dreaMTank on 2024/01/27.
//

import Foundation

enum Gender {
    case male , feamle , unspecified
}

struct Person {
    let name: String
    let birthdate: Data?
    let middleName: String?
    let address: String?
    let gender: Gender
      
    var username = "KanyeWest"
    init(name: String, birthdate: Data?, middleName: String?, address: String?, gender: Gender) {
        self.name = name
        self.birthdate = birthdate
        self.middleName = middleName
        self.address = address
        self.gender = gender
    }
}
