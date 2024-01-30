//
//  Bus.swift
//  MVVMBindingsBus
//
//  Created by dreaMTank on 2024/01/30.
//

import Foundation
final class Bus {
    static let shared = Bus()
    
    private init() {}
    
    enum EventType {
        case userFetch
    }
    
    struct Subscription {
        let type: EventType
        let queue: DispatchQueue
        let block: ((Event<[User]>) ->Void)
    }
    
    private var subscriptions = [Subscription]()
    
    //Subscriptions
    func subscribe(_ event: EventType,
                   block: @escaping ((Event<[User]>) ->Void)
    ){
        let new = Subscription(type: event, queue: .global(), block: block)
        subscriptions.append(new)
        
    }
    
    
    func subscribeOnMain(_ event: EventType,
                         block: @escaping ((Event<[User]>) ->Void)
          ){
        let new = Subscription(type: event, queue: .main, block: block)
        subscriptions.append(new)
    }
    
    //Publications
    func publish(type: EventType,_ event: UserFetchEvent) {
        let subscribers = subscriptions.filter( { $0.type == type})
        subscriptions.forEach{subscriber in
            subscriber.queue.async {
                subscriber.block(event)
            }
        }
    }
}
