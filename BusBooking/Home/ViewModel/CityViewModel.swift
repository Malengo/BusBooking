//
//  CityModel.swift
//  BusBooking
//
//  Created by user on 26/08/22.
//

import Foundation

protocol CityViewModelProtocol {
    func getTraveModel(_ cityDeparture: City, _ cityDestination: City)
    func getCityByName(name: String) -> City?
    func numberOfRows() -> Int
    func getCity(at index: Int) -> City
    
    var delegate: CityViewModelDelegate? { get set }
}

protocol CityViewModelDelegate: AnyObject {
    func thereAreTravels(model: TravelViewModel)
    func thereAreNoTravels()
}

struct CityViewModel: CityViewModelProtocol {
    
    private var cities: [City]
    weak var delegate: CityViewModelDelegate?
    
    init(){
        self.cities = Cities().list
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
}
