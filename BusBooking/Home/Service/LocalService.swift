//
//  LocalService.swift
//  BusBooking
//
//  Created by Jose Augusto on 30/03/23.
//

import Foundation

protocol PromotionProtocol {
    func getPromotions() -> [Promotion]
}

struct LocalService: PromotionProtocol {
    func getPromotions() -> [Promotion] {
        guard let fileURL = Bundle.main.url(forResource: "Promotion", withExtension: "json") else { return [] }
        
        do {
            let jsonData = try Data(contentsOf: fileURL)
            let promotions = try JSONDecoder().decode([Promotion].self, from: jsonData)
            return promotions
        } catch {
            return []
        }
    }
}
