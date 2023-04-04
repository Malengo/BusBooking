//
//  CityModel.swift
//  BusBooking
//
//  Created by user on 26/08/22.
//

import Foundation
import RemoteConfig

protocol CityViewModelProtocol {
    func getTraveModel(_ cityDeparture: City, _ cityDestination: City)
    func getCityByName(name: String) -> City?
    func numberOfRows() -> Int
    func getCity(at index: Int) -> City
    func mumberOfPromtions() -> Int
    func getPromotion(at index: Int) -> Promotion
    func isPromotionValid() async -> Bool
    var delegate: CityViewModelDelegate? { get set }
}

protocol CityViewModelDelegate: AnyObject {
    func thereAreTravels(model: TravelViewModel)
    func thereAreNoTravels()
}

struct CityViewModel: CityViewModelProtocol {
    
    private var cities: [City]
    var promotion: [Promotion]
    
    private var service: PromotionProtocol
    private var remoteConfig = HomeRemoteConfig()
    
    weak var delegate: CityViewModelDelegate?
    
    init(service: PromotionProtocol){
        self.service = service
        self.cities = Cities().list
        self.promotion = service.getPromotions()
    }
    
    func getCityByName(name: String) -> City? {
        return cities.filter { $0.name == name }.first
    }
    
    func numberOfRows() -> Int {
        return cities.count
    }
    
    func getCity(at index: Int) -> City {
        return cities[index]
    }
    
    func getTraveModel(_ cityDeparture: City, _ cityDestination: City) {
        let travelViewModel = TravelViewModel(travel: Travel(departure: cityDeparture, destination: cityDestination))
        
        if !travelViewModel.travels.isEmpty {
            self.delegate?.thereAreTravels(model: travelViewModel)
        } else {
            self.delegate?.thereAreNoTravels()
        }
    }
    
    func mumberOfPromtions() -> Int { promotion.count }
    
    func getPromotion(at index: Int) -> Promotion { promotion[index] }
    
    func isPromotionValid() async -> Bool { await remoteConfig.isPromotionValid() }
}
