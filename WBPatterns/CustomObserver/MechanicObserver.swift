//
//  mechanic_observer.swift
//  WBPatterns
//
//  Created by Назар Ткаченко on 20.07.2024.
//

final class MechanicObserver: Observer {
    
    var subscribers: [Subscriber] = []
    
    func propertyChanged(propertyName: String,
                         oldValue: Int,
                         newValue: Int,
                         options: [String:String]?) {
        print("Change in property detected, notifying subscribers")
        let matchingSubscribers = subscribers.filter({$0.properties.contains(propertyName)})
        
        matchingSubscribers.forEach({
            $0.notify(propertyName: propertyName, oldValue: oldValue, newValue: newValue,
                      options: options)})
    }
    
    func subscribe(subscriber: Subscriber) {
        subscribers.append(subscriber)
    }
    
    func unsubscribe(subscriber: Subscriber) {
        subscribers = subscribers.filter({$0 !== subscriber})
    }
}
