//
//  UserInfoViewController.swift
//  
//
//  Created by Jose Malengo on 11/06/23.
//
import UIKit
import FirebaseAuth

class UserInfoViewController: UIViewController {

    @IBOutlet weak var foneTextfield: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserInformation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .never
    }

    private func setupUserInformation() {
        guard let user = Auth.auth().currentUser else { return }
        
        configureTextField(value: user.email, textField: emailTextField)
        configureTextField(value: user.displayName, textField: userTextField)
        configureTextField(value: user.phoneNumber, textField: foneTextfield)
    }
    
    @IBAction func saveUserInfo(_ sender: UIButton) {
        let name = userTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let fone = foneTextfield.text ?? ""
        let user = UserAuth(name: name, email: email, fone: fone)
        AuthenticationUser().updateUserInformation(user: user)
    }
    
    private func configureTextField(value: String?, textField: UITextField) {
        if let newValue = value {
            textField.text = newValue
        } else {
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = UIColor.red.cgColor
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
