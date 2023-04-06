//
//  UITextFieldSpy.swift
//  BusBookingTests
//
//  Created by Jose Augusto on 06/04/23.
//

import UIKit

class UITextFieldSpy: UITextField {

    override func resignFirstResponder() -> Bool {
        self.text = nil
        return true
    }
}
