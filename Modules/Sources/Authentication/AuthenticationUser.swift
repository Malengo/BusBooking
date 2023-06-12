//
//  File.swift
//  
//
//  Created by Jose Malengo on 17/05/23.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import UIKit


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
    
    public func showUserInformation(viewController: UIViewController) {
        guard let viewControllerUser = UIStoryboard(name: "UserInfo", bundle: Bundle.module).instantiateViewController(withIdentifier: "userInfo") as? UserInfoViewController else { return }
        
        viewController.navigationController?.pushViewController(viewControllerUser, animated: true)
    }
    
    func updateUserInformation(user: UserAuth) {
        guard let userAuthentication = Auth.auth().currentUser else { return }
        let updateChanges = userAuthentication.createProfileChangeRequest()
        updateChanges.displayName = user.name
        updateChanges.commitChanges { error in
            print("displayname error")
        }
        userAuthentication.updateEmail(to: user.email) { error in
            print("email error")
        }
    }
}
