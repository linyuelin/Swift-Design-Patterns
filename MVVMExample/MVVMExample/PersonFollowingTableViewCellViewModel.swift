//
//  PersonFollowingTableViewCellViewModel.swift
//  MVVMExample
//
//  Created by dreaMTank on 2024/01/27.
//


import UIKit

struct PersonFollowingTableViewCellViewModel {
    let name: String
    let username: String
    var currentlyFollowing: Bool
    let image: UIImage?
    
    
    init(with model: Person) {
        name = model.name
        username = model.username
        currentlyFollowing = false
        image = UIImage(systemName: "person")
    }
}
