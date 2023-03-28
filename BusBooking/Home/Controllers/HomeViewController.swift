//
//  ViewController.swift
//  BusBooking
//
//  Created by user on 16/08/22.
//

import UIKit

class HomeViewController: BaseViewController {

    lazy var homeView: HomeView = {
        var view = HomeView()
        return view
    }()
    
    var cityViewModel: CityViewModelProtocol = CityViewModel()
    
    // MARK: - LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bus Booking"
        setupAction()
        setupDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homeView.defaultParameters()
        setupNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        homeView.defaultParameters()
    }
    
    override func loadView() {
        homeView.setupView()
        view = homeView
    }
    
    // MARK: - private Func
    private func setupAction() {
        homeView.swapButton.addTarget(self, action: #selector(swapButtonPressed), for: .touchDown)
        homeView.buttonSearchTicket.addTarget(self, action: #selector(searchTravel), for: .touchUpInside)
    }
    
    private func setupNavigationBar() {
        navigationController?.view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.backButtonDisplayMode = .minimal
    }
    
    @objc private func searchTravel() {
        getTravels()
    }
    
    @objc private func swapButtonPressed() {
        homeView.swapText()
    }
    
    private func getTravels() {        
        guard let cityDeparture = cityViewModel.getCityByName(name: homeView.getDepertureText()),
              let cityDestination = cityViewModel.getCityByName(name: homeView.getArrivalText())
        else { return }
        
        cityViewModel.getTraveModel(cityDeparture, cityDestination)
    }
    
    private func setupDelegate() {
        cityViewModel.delegate = self
        homeView.setTexFieldDelegate(view: self)
        homeView.picker.delegate = self
        homeView.promotionCollection.delegate = self
        homeView.promotionCollection.dataSource = self
    }
}

// MARK: - TextField Delegate
extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        homeView.picker.isHidden = false
        textField.inputView = homeView.picker
        return true
    }
}

// MARK: - Picker Delegate and DataSource
extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityViewModel.numberOfRows()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityViewModel.getCity(at: row).name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let city = cityViewModel.getCity(at: row)
        if homeView.departureTextField.isEditing {
            homeView.departureTextField.text = city.name
        } else {
            homeView.arrivalTextField.text = city.name
        }
    }
}

// MARK: - CityViewModel Protocol
extension HomeViewController: CityViewModelDelegate {
    func thereAreTravels(model: TravelViewModel) {
        let vc = ListTravelTableViewController()
        vc.travelViewModel = model
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func thereAreNoTravels() {
        let alert = UIAlertController(title: "Passagens", message: "Não existe passagens para o trecho escolhido", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Fechar", style: .default))
        
        self.present(alert, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PromotionCell", for: indexPath) as? PromotionCollectionViewCell else { return UICollectionViewCell()   }
        return cell
    }
    
    
}


