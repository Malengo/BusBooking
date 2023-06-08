//
//  File.swift
//  
//
//  Created by Jose Malengo on 17/05/23.
//

import Foundation
import FirebaseCore
import FirebaseAuth

public class AuthenticationUser {
    
    public var isUserLogged: Bool {
        get{
            return Auth.auth().currentUser != nil ? true : false
        }
    }
    
    public init(){}
    
    public func createUser(email: String, password: String, completion: @escaping (Result<String, AuthErrorEnum>) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                if let errCode = error as NSError? {
                    completion(.failure(AuthErrorEnum(raw: errCode.code)))
                }
            } else {
                completion(.success(result?.user.description ?? "vazio"))
            }
        }
    }
}
