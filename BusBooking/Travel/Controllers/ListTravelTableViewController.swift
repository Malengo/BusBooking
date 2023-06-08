//
//  ListTravelTableViewController.swift
//  BusBooking
//
//  Created by user on 26/08/22.
//

import UIKit

class ListTravelTableViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    lazy var travelView: TravelView = {
        let view = TravelView()
        return view
    }()
    
    var travelViewModel: TravelViewModelProtocol?
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = TravelConstant.viewTitle
        setupDelegate()
        travelView.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func loadView() {
        travelView.setupView()
        view = travelView
    }
    
    // MARK: - Private func
    private func setupDelegate() {
        travelView.tableView.dataSource = self
        travelView.tableView.delegate = self
    }
   
    // MARK: - TableView data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return travelViewModel?.travels.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelConstant.cellIdentifier, for: indexPath) as? ListTravelViewCell
        travelViewModel?.selectTravel(at: indexPath.row) { travel in
            cell?.configureCellWith(travel)
        }            
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SeatsCollectionViewController()
        travelViewModel?.selectTravel(at: indexPath.section) { travel in
            vc.seatsViewModel = SeatsViewModel(travel: travel)
        }
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
}
