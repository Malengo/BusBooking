//
//  LoginViewController.swift
//  BusBooking
//
//  Created by Jose Malengo on 11/05/23.
//

import UIKit
import Authentication

class LoginViewController: UIViewController {
    
    lazy var loginView: LoginView = {
        var view = LoginView()
        return view
    }()
    
    var loginViewModel: LoginViewModel?
    
    override func loadView() {
        loginView.setupView()
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupViewModel()
        loginView.loginButton.addAction(createActionButton(), for: .touchUpInside)
    }
    
    func setupViewModel() {
        loginViewModel = LoginViewModel()
        loginViewModel?.successHandler = {
            self.navigationController?.pushViewController(HomeViewController(), animated: true)
        }
        
        loginViewModel?.errorHandler = { error in
            print(error)
        }
    }
    
    func createActionButton() -> UIAction {
        return UIAction { action in
            self.loginViewModel?.createUserLogin(with: self.loginView.emailTextField.text ?? "", and: self.loginView.passwordTextField.text ?? "")
        }
    }

}
