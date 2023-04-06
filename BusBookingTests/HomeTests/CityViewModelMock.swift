//
//  CityViewModelMock.swift
//  BusBookingTests
//
//  Created by Jose Augusto on 06/04/23.
//

import Foundation
@testable import BusBooking

class CityViewModelMock: CityViewModelProtocol {
   
    var wasPromotionValidCalled = false
    var promotionValidCompletionHandler: (() -> Void)?
    var delegate: BusBooking.CityViewModelDelegate?
    
    func getTraveModel(_ cityDeparture: BusBooking.City, _ cityDestination: BusBooking.City) {
        
    }
    
    func getCityByName(name: String) -> BusBooking.City? {
        City(name: "Teste", long: 1.1, lat: 1.1)
    }
    
    func numberOfRows() -> Int {
        1
    }
    
    func getCity(at index: Int) -> BusBooking.City {
        City(name: "Teste", long: 1.1, lat: 1.1)
    }
    
    func mumberOfPromtions() -> Int {
        1
    }
    
    func getPromotion(at index: Int) -> BusBooking.Promotion {
        Promotion(name: "Teste", price: 12, image: "Teste")
    }
    
    func isPromotionValid() async -> Bool {
        wasPromotionValidCalled = true
        promotionValidCompletionHandler?()
        return wasPromotionValidCalled
    }
    
    
}
