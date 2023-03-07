//
//  SeatsViewModel.swift
//  BusBooking
//
//  Created by user on 13/09/22.
//

import Foundation

struct SeatsViewModel {
    
    var bus: Bus?
    
    init(travel: Travel) {
        self.bus = Buses().getBus(travel: travel)
        getAllSeats()
    }
    
    mutating func getAllSeats() {
        self.bus?.seats[2].isOccuped = true
        self.bus?.seats[15].isOccuped = true
        self.bus?.seats[23].isOccuped = true
        self.bus?.seats[48].isOccuped = true
    }
    
    func isSeatOccuped(at section: Int, and row: Int, on isleft: Bool, completion: @escaping (_ seat: Seat, _ position: Int) ->()) {
        let position = getSeatPosition(at: section, row: row, isLeft: isleft)
        completion(self.bus!.seats[position] , position)
    }
    
    private func getSeatPosition(at section: Int, row: Int, isLeft: Bool) -> Int {
        let newSection = section + 1
        var positionRight = newSection * 2
        var positionLeft = section + newSection
        if isLeft {
            if row == 1 {
                positionRight = (positionRight * 2) - 2
                return positionRight
            } else {
                positionLeft = (positionLeft * 2) - 1
                return positionLeft
            }
        } else {
            if row == 1 {
                positionRight = (positionRight * 2)
                return positionRight
            } else {
                positionLeft = (positionLeft * 2) + 1
                return positionLeft
            }
        }
    }
    
    mutating func setSeat(at position: Int,as isSelected: Bool) {
        bus?.seats[position].isSelected = isSelected
    }
    
    func getSeat(at position: Int) -> Seat? {
        return bus?.seats[position]
    }
    
    func selectedSeats(completion: @escaping (([Seat]) -> ()) ) {
        completion( bus?.seats.filter { $0.isSelected == true } ?? [] )
    }
}
