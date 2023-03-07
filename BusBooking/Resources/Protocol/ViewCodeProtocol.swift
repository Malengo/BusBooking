//
//  ViewCodeProtocol.swift
//  BusBooking
//
//  Created by user on 16/08/22.
//

import UIKit

protocol ViewCodeProtocol: UIView {
    func buildViewHierachy()
    func setupConstraints()
    func addictionalConfiguration()
}

extension ViewCodeProtocol {
    func setupView() {
        buildViewHierachy()
        setupConstraints()
        addictionalConfiguration()
    }
}
