//
//  HomeRemoteConfig.swift
//  BusBooking
//
//  Created by Jose Augusto on 31/03/23.
//

import Foundation
import FirebaseCore
import FirebaseRemoteConfig

protocol HomeRemoteConfigProtocol {
    mutating func setupRemoteConfig()
    func setupDefaultValues()
    func isPromotionValid() async -> Bool
    
    var remoteConfig: RemoteConfig { get set }
    var settings: RemoteConfigSettings { get set }
}

public struct HomeRemoteConfig: HomeRemoteConfigProtocol {
    
    var remoteConfig: RemoteConfig = RemoteConfig.remoteConfig()
    var settings: RemoteConfigSettings = RemoteConfigSettings()
    
    public init() {
        setupRemoteConfig()
        setupDefaultValues()
    }

    mutating func setupRemoteConfig() {
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }
    
    func setupDefaultValues() {
        let defautValues = ["isPromotion" : true as NSObject]
        remoteConfig.setDefaults(defautValues)
    }
    
    public func isPromotionValid() async -> Bool {
        var isPromotionValid = false
        do {
            try await remoteConfig.fetchAndActivate()
            isPromotionValid = remoteConfig["isPromotion"].boolValue
            return isPromotionValid
        } catch {
            return isPromotionValid
        }
    }
}
