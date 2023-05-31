//
//  AuthErrorEnum.swift
//  
//
//  Created by Jose Malengo on 28/05/23.
//

import Foundation

public enum AuthErrorEnum: Int, Error {
    case undefined = 0
    case emailAlreadyExistis = 17007
    case emailFormattedWrong = 17008
    case weakPassword = 17026
    case emailWrong = 17023
    
    init(raw: Int) {
        if let errorEnum = AuthErrorEnum(rawValue: raw) {
            self = errorEnum
        } else {
            print("Erro desconhecido armazenado \(raw)")
            self = .undefined
        }
    }
    
    public var description: String {
        switch self {
        case .weakPassword:
            return "A senha deve ter no minímo 6 caracteres"
        case .emailFormattedWrong:
            return "Forneça um email no formato correto"
        case .emailAlreadyExistis:
            return "Email já existe"
        default:
            return "Erro desconhecido\(self)"
        }
    }
}
