//
//  Bus.swift
//  BusBooking
//
//  Created by user on 06/09/22.
//

import Foundation

struct Bus {
    var companyName: String
    var travel: Travel
    var seats = Array(repeating: Seat(isOccuped: false, isSelected: false), count: 50)
}

struct Seat {
    var isOccuped: Bool
    var isSelected: Bool
}

struct Buses {
    var buses: [Bus] = [Bus(companyName: "Viação Céu Azul", travel: Travels().travels[1]),
                        Bus(companyName: "Viaçao Passáro Verde", travel: Travels().travels[2]),
                        Bus(companyName: "Viação Verde Amarelo", travel: Travels().travels[3])]
    
    func getBus(travel : Travel) -> Bus? {
        
        guard let bus = buses.first(where: { $0.travel.id == travel.id } )  else { return nil }
        return bus
    }
}
