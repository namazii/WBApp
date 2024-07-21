//
//  RootView.swift
//  WBPatterns
//
//  Created by Назар Ткаченко on 19.07.2024.
//

import SwiftUI

struct RootView<SettingsType: Settings>: View {
    @ObservedObject var settings: SettingsType
    
    var body: some View {
        VStack {
            Toggle(isOn: $settings.isDarkModeEnabled) {
                Text("Dark Mode")
            }
            .padding()
            .preferredColorScheme(settings.isDarkModeEnabled ? .dark : .light)
            
            // пример observer не используя инструментарий из коробки
            .onAppear(perform: {
                let mountainView = Zipcode(value: "94043", baseRate: 40.00)
                let redwoodCity = Zipcode(value: "94063", baseRate: 30.00)
                let paloAlto = Zipcode(value: "94301", baseRate: 50.00)
                let sunnyvale = Zipcode(value: "94086", baseRate: 35.00)
                
                let zipcodes: Set<Zipcode> = [mountainView, redwoodCity, paloAlto, sunnyvale]
                
                let steve = Mechanic(name: "Steve Akio", location: mountainView)
                let joe = Mechanic(name: "Joe Jackson", location: redwoodCity)
                let jack = Mechanic(name: "Jack Joesph", location: redwoodCity)
                let john = Mechanic(name: "John Foo", location: paloAlto)
                let trevor = Mechanic(name: "Trevor Simpson", location: sunnyvale)
                let brian = Mechanic(name: "Brian Michaels", location: sunnyvale)
                let tom = Mechanic(name: "Tom Lee", location: sunnyvale)
                let mike = Mechanic(name: "Mike Cambell", location: mountainView)
                let jane = Mechanic(name: "Jane Sander", location: mountainView)
                let ali = Mechanic(name: "Ali Ham", location: paloAlto)
                let sam = Mechanic(name: "Sam Fox", location: mountainView)
                let reza = Mechanic(name: "Reza Shirazian", location: mountainView)
                let max = Mechanic(name: "Max Watson", location: sunnyvale)
                let raj = Mechanic(name: "Raj Sundeep", location: sunnyvale)
                let bob = Mechanic(name: "Bob Anderson", location: mountainView)
                
                let mechanics = [steve, joe, jack, john, trevor, brian,
                                 tom, mike, jane, ali, sam, reza, max, raj, bob]
                
                var supply: [Zipcode: Int] = [:]
                
                zipcodes.forEach({(zipcode: Zipcode) in
                    supply[zipcode] = mechanics.filter({(mechanic: Mechanic) in
                        mechanic.status == Status.Idle && mechanic.zipcode === zipcode}).count})
                
                let priceManager = ZipcodePriceManager(zipcodes: zipcodes, supply: supply)
                
                let observer = MechanicObserver()
                
                observer.subscribe(subscriber: priceManager)
                
                mechanics.forEach({$0.observer = observer})
                
                john.status = .OnTheWay
                steve.status = .OnTheWay
                steve.status = .Busy
                steve.status = .Idle
                trevor.status = .OnTheWay
                brian.status = .OnTheWay
                tom.status = .OnTheWay
                reza.status = .OnTheWay
                tom.status = .Busy
                raj.status = .OnTheWay
                
                observer.unsubscribe(subscriber: priceManager)
                print("unsubscribed")
                
                raj.status = .Idle
            })
        }
    }
}
