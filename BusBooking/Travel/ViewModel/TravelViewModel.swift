//
//  TravelModel.swift
//  BusBooking
//
//  Created by user on 26/08/22.
//

import Foundation


struct TravelViewModel {
    
    var travels: [Travel] = []
    private var travel: Travel
    
    init(travel: Travel) {
        self.travel = travel
        getTravel()
    }
    
    private mutating func getTravel() {
        self.travels = Travels().travels.filter { $0 == self.travel }
    }
    
    func selectTravel(at position: Int, completion: @escaping (Travel) -> ()) {
        completion(travels[position])
    }
}

extension Date {
    func getShortDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM, h:mm"
        let short = formatter.string(from: self)
        return short
    }
    
    func getShortHour() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let hourString = formatter.string(from: self)
        return hourString
    }
}
