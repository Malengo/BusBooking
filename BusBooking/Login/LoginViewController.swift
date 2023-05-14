//
//  LoginViewController.swift
//  BusBooking
//
//  Created by Jose Malengo on 11/05/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var loginView: LoginView = {
        var view = LoginView()
        return view
    }()
    
    override func loadView() {
        loginView.setupView()
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
