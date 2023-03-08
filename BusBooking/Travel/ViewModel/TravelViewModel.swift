//
//  TravelModel.swift
//  BusBooking
//
//  Created by user on 26/08/22.
//

import Foundation

protocol TravelViewModelProtocol {
    func selectTravel(at position: Int, completion: @escaping (Travel) -> ())
    mutating func getTravel()
    
    var travels: [Travel] { get set }
}

struct TravelViewModel: TravelViewModelProtocol {
    
    var travels: [Travel] = []
    private var travel: Travel
    
    init(travel: Travel) {
        self.travel = travel
        getTravel()
    }
    
    mutating func getTravel() {
        self.travels = Travels().travels.filter { $0 == self.travel }
    }
    
    func selectTravel(at position: Int, completion: @escaping (Travel) -> ()) {
        completion(travels[position])
    }
}


