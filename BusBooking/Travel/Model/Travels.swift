//
//  Travels.swift
//  BusBooking
//
//  Created by user on 26/08/22.
//

import Foundation

struct Travels {
    let travels: [Travel] = [
        Travel(id: "1", departure: Cities().list[1], destination: Cities().list[2], date: Date.now + 300, value: 100.00, departureTime: Date.now + 3),
        Travel(id: "2", departure: Cities().list[1], destination: Cities().list[2], date: Date.now + 500, value: 200.00, departureTime: Date.now + 3),
        Travel(id: "3", departure: Cities().list[1], destination: Cities().list[2], date: Date.now + 700, value: 300.00, departureTime: Date.now + 3),
        Travel(id: "4", departure: Cities().list[1], destination: Cities().list[2], date: Date.now + 900, value: 400.00, departureTime: Date.now + 3)
    ]
}
