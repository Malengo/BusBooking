//
//  BaseViewController.swift
//  BusBooking
//
//  Created by user on 28/10/22.
//

import UIKit
import Authentication

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: #selector(self.showUser))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc
    func showUser() {
        AuthenticationUser().showUserInformation(viewController: self)
    }
}
