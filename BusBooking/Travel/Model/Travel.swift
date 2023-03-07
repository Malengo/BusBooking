//
//  Travel.swift
//  BusBooking
//
//  Created by user on 26/08/22.
//

import Foundation
import CoreLocation

struct Travel: Equatable {
    
    var id: String?
    var departure: City
    var destination: City
    var date: Date?
    var value: Double?
    var departureTime: Date?
    var arriveTime: String?
    
    init(id: String, departure: City, destination: City, date: Date, value: Double, departureTime: Date) {
        self.id = id
        self.departure = departure
        self.destination = destination
        self.date = date
        self.value = value
        self.departureTime = departureTime
    }
    
    init(departure: City, destination: City) {
        self.departure = departure
        self.destination = destination
    }
    
    var distance: Double {
        let coordinateDeparture = CLLocation(latitude: departure.lat, longitude: departure.long)
        let coordinateDestination = CLLocation(latitude: destination.lat, longitude: destination.long)
        let meters = coordinateDeparture.distance(from: coordinateDestination)
        return Double(round(meters / 1000))
    }
    
    var travelTime: String {
        let minutes = Int(Double(round((distance.truncatingRemainder(dividingBy: 100.0) / 100) * 60)))
        let hour = Int(distance) / 100
        return "O tempo de Viagem é \(hour)h e \(minutes)min"
    }
    
    static func == (lhs: Travel, rhs: Travel) -> Bool {
        return lhs.departure.name == rhs.departure.name && lhs.destination.name == rhs.destination.name ? true : false
    }
}
