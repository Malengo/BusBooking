//
//  PromotionViewModel.swift
//  BusBooking
//
//  Created by Jose Malengo on 07/05/23.
//

import Foundation
import RemoteConfig

protocol PromotionViewModelProtocol {
    func mumberOfPromtions() -> Int
    func getPromotion(at index: Int) -> Promotion
    func isPromotionValid() async -> Bool
}
struct PromotionViewModel: PromotionViewModelProtocol {
    
    private var service: PromotionProtocol
    private var promotion: [Promotion]
    
    private var remoteConfig = HomeRemoteConfig()
    
    init(service: PromotionProtocol) {
        self.service = service
        self.promotion = service.getPromotions()
    }
    
    func mumberOfPromtions() -> Int { promotion.count }
    
    func getPromotion(at index: Int) -> Promotion { promotion[index] }
    
    func isPromotionValid() async -> Bool { await remoteConfig.isPromotionValid() }
}
