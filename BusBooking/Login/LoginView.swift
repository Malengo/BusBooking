//
//  LoginView.swift
//  BusBooking
//
//  Created by Jose Malengo on 11/05/23.
//

import UIKit

class LoginView: UIView, ViewCodeProtocol {
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.placeholder = "Email"
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Senha"
        textField.leftViewMode = .always
        textField.leftView?.frame = CGRect(x: 0, y: 5, width: 10, height: 10)
        textField.leftView = UIImageView(image: UIImage(named: "email"))
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 3
        button.backgroundColor = Colors.mainColor
        return button
    }()
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 9
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    func buildViewHierachy() {
        addSubview(mainStack)
        mainStack.addArrangedSubview(emailTextField)
        mainStack.addArrangedSubview(passwordTextField)
        mainStack.addArrangedSubview(loginButton)
    }
    
    func setupConstraints() {
        mainStack.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        mainStack.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        mainStack.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        mainStack.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
    }
    
    func addictionalConfiguration() {
        backgroundColor = .white
    }
    
}
