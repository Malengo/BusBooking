//
//  BaseTextField.swift
//  BusBooking
//
//  Created by Jose Malengo on 17/05/23.
//

import UIKit

class BaseTextField: UITextField {

    init(placeholder: String, image: String) {
        super.init(frame: .zero)
        initDefaults(placeholder, image)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func initDefaults(_ placeholder: String,_ image: String) {
        self.placeholder = placeholder
        self.layer.borderWidth = 0.3
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: image)
        imageView.tintColor = .systemGray3
        self.leftView = imageView
        self.leftViewMode = .always
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0))
    }
    
}
