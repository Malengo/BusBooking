//
//  LoginViewModel.swift
//  BusBooking
//
//  Created by Jose Malengo on 31/05/23.
//

import Foundation
import Authentication

struct LoginViewModel {
    
    var successHandler: (() -> Void)?
    var errorHandler: ((_ error: String) -> Void)?
    private let authentication = AuthenticationUser()
    
    func createUserLogin(with email: String, and password: String) {
        authentication.createUser(email: email, password: password) { result in
            switch result {
            case .success( _):
                successHandler?()
            case .failure(let error):
                errorHandler?(error.description)
            }
        }
    }
}
