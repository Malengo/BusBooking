//
//  HomeView.swift
//  BusBooking
//
//  Created by user on 16/08/22.
//

import UIKit

class HomeView: UIView, ViewCodeProtocol {
    
    // MARK: - Visual Components
    lazy var departureTextField: UITextField = {
        var text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "De Onde?"
        text.font = UIFont.systemFont(ofSize: 23)
        return text
    }()
    
    lazy var arrivalTextField: UITextField = {
        var text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Para Onde?"
        text.font = UIFont.systemFont(ofSize: 23)
        return text
    }()
    
    private(set) lazy var swapButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.up.arrow.down", withConfiguration: UIImage.SymbolConfiguration(weight: .heavy)), for: .normal)
        button.backgroundColor = Colors.mainColor
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        return button
    }()
    
    private(set) lazy var buttonSearchTicket: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Encontrar Passagens", for: .normal)
        button.backgroundColor = Colors.mainColor
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        self.layer.masksToBounds = true
        return button
    }()
    
    private(set) lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.isHidden = true
        return picker
    }()
    
    private(set) lazy var promotionCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 200)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.clipsToBounds = true
        collection.layer.cornerRadius = 8
        collection.register(PromotionCollectionViewCell.self, forCellWithReuseIdentifier: "PromotionCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    // MARK: - Stack Components
    private(set) lazy var searchView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 18
        view.clipsToBounds = true
        return view
    }()
    
    private(set) lazy var spacingView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()
    
    private(set) lazy var stackDestination: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        return stack
    }()
    
    // MARK: - ViewCode Protocol
    func buildViewHierachy() {
        addSubview(searchView)
        addSubview(buttonSearchTicket)
        addSubview(promotionCollection)
        addSubview(picker)
        searchView.addSubview(stackDestination)
        searchView.addSubview(swapButton)
        stackDestination.addArrangedSubview(departureTextField)
        stackDestination.addArrangedSubview(spacingView)
        stackDestination.addArrangedSubview(arrivalTextField)
    }
    
    func setupConstraints() {
        searchView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 18).isActive = true
        searchView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -18).isActive = true
        searchView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 18).isActive = true
        searchView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        swapButton.rightAnchor.constraint(equalTo: searchView.rightAnchor, constant: -18).isActive = true
        swapButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        swapButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        swapButton.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        
        picker.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        picker.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        picker.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        stackDestination.topAnchor.constraint(equalTo: searchView.topAnchor).isActive = true
        stackDestination.bottomAnchor.constraint(equalTo: searchView.bottomAnchor).isActive = true
        stackDestination.rightAnchor.constraint(equalTo: swapButton.leftAnchor, constant: -18).isActive = true
        
        spacingView.leftAnchor.constraint(equalTo: searchView.leftAnchor, constant: 18).isActive = true
        spacingView.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        spacingView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        buttonSearchTicket.topAnchor.constraint(equalTo: stackDestination.bottomAnchor, constant: 18).isActive = true
        buttonSearchTicket.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 18).isActive = true
        buttonSearchTicket.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -18).isActive = true
        buttonSearchTicket.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        promotionCollection.topAnchor.constraint(equalTo: buttonSearchTicket.bottomAnchor, constant: 50).isActive = true
        promotionCollection.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 18).isActive = true
        promotionCollection.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -18).isActive = true
        promotionCollection.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func addictionalConfiguration() {
        backgroundColor = .systemBackground
        promotionCollection.isHidden = true
    }
    
    // MARK: - Public Functions
    func setTexFieldDelegate(view: UITextFieldDelegate) {
        departureTextField.delegate = view
        arrivalTextField.delegate = view
    }
    
    func getDepertureText() -> String {
        return departureTextField.text ?? ""
    }
    
    func getArrivalText() -> String {
        return arrivalTextField.text ?? ""
    }
    
    func swapText() {
        guard let deperture = departureTextField.text, let arrival = arrivalTextField.text else { return }
        arrivalTextField.text = deperture
        departureTextField.text = arrival
    }
    
    func clearText() {
        arrivalTextField.text = ""
        departureTextField.text = ""
    }
    
    func defaultParameters() {
        picker.isHidden = true
        arrivalTextField.resignFirstResponder()
        departureTextField.resignFirstResponder()
    }
    
    func showPromotion(_ isShow: Bool) {
        promotionCollection.isHidden = !isShow
    }
    
}
