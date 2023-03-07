//
//  TravelView.swift
//  BusBooking
//
//  Created by user on 26/08/22.
//

import UIKit

class TravelView: UIView, ViewCodeProtocol {
    
    private(set) lazy var tableView: UITableView = {
        var table = UITableView()
        table.backgroundColor = .systemGray6
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ListTravelViewCell.self, forCellReuseIdentifier: "Cell")
        return table
    }()
    
    
    func buildViewHierachy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 18).isActive = true
        tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -18).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func addictionalConfiguration() {
        backgroundColor = .systemGray6
    }
    

   

}
