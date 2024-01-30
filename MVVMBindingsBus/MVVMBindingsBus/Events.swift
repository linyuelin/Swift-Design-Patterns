//
//  Events.swift
//  MVVMBindingsBus
//
//  Created by dreaMTank on 2024/01/30.
//

import Foundation

class Event<T> {
    let identifier: String
    let result: Result<T, Error>?
    
    init (
        identifier: String,
        result: Result<T , Error>?
    ){
        self.identifier = identifier
        self.result = result
    }
}

// Sub-class of Events

class UserFetchEvent: Event<[User]> {
    
}

// Models
struct User: Codable {
    let name: String
}
