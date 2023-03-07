//
//  SeatsView.swift
//  BusBooking
//
//  Created by user on 06/09/22.
//

import UIKit

class SeatsView: UIView, ViewCodeProtocol {
    
    
    private(set) lazy var collectionLeft: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.clipsToBounds = true
        collection.layer.cornerRadius = 8
        collection.allowsMultipleSelection = true
        return collection
    }()
    
    private(set) lazy var collectionRight: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.clipsToBounds = true
        collection.layer.cornerRadius = 8
        collection.allowsMultipleSelection = true
        return collection
    }()
    
    private(set) lazy var busySeatTextField: UITextField = {
        var text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.leftViewMode = .always
        text.font = UIFont.systemFont(ofSize: 15)
        text.text = "Ocupado"
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chair")
        imageView.tintColor = .systemGray
        text.leftView = imageView
        return text
    }()
    
    private(set) lazy var availableSeatTextField: UITextField = {
        var text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.leftViewMode = .always
        text.font = UIFont.systemFont(ofSize: 15)
        text.text = "Disponível"
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chair")
        imageView.tintColor = Colors.avalibleSeatsColor
        text.leftView = imageView
        return text
    }()
    
    private(set) lazy var selectedSeatTextField: UITextField = {
        var text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.leftViewMode = .always
        text.font = UIFont.systemFont(ofSize: 15)
        text.text = "Selecionado"
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chair")
        imageView.tintColor = .systemRed
        text.leftView = imageView
        return text
    }()
    
    private(set) lazy var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continuar", for: .normal)
        button.backgroundColor = Colors.mainColor
        button.clipsToBounds = true
        button.layer.cornerRadius = 9
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private(set) lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.configuration = UIButton.Configuration.filled()
        button.configuration?.image = UIImage(systemName: "arrowtriangle.backward.fill")
        button.configuration?.image?.withTintColor(.white)
        button.configuration?.baseBackgroundColor = Colors.mainColor
        button.configuration?.buttonSize = .large
        button.configuration?.imagePadding = 1
        return button
    }()
    
    private(set) lazy var headerView: UIView = {
        let stack = UIView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = Colors.mainColor
        stack.layer.cornerRadius = 20
        stack.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        stack.clipsToBounds = true
        return stack
    }()
    
    private(set) lazy var arrowDestination: UIImageView = {
        var image = UIImageView(image: UIImage(systemName: "arrow.right.square.fill"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .white
        return image
    }()
    
    private(set) lazy var arriveCityLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20.0)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Bragança"
        return label
    }()
    
    private(set) lazy var departureCityLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20.0)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .right
        label.text = "Bragança"
        return label
    }()
    
    private(set) lazy var BusCompanyNameText: UITextField = {
        let text = UITextField()
        text.text = "Auto Aviação"
        text.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        text.textColor = Colors.mainColor
        return text
    }()
    
    private(set) lazy var hourDepartureText: UITextField = {
        let text = UITextField()
        text.text = "15:00 hr"
        text.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        text.textColor = Colors.mainColor
        return text
    }()
    
    private(set) lazy var quantatySeatText: UITextField = {
        let text = UITextField()
        text.text = "Assentos: 2"
        return text
    }()
    
    private(set) lazy var priceText: UITextField = {
        let text = UITextField()
        text.text = "R$ 100,00"
        return text
    }()
    
    // MARK: - Containers
    
    private(set) lazy var stackMain: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 18
        stack.distribution = .fillEqually
        return stack
    }()
    
    private(set) lazy var stackSeats: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 18
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.backgroundColor = .systemGray6
        return stack
    }()
    
    private(set) lazy var stackTravelInformation: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .systemBackground
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 20
        return stack
    }()
    
    private(set) lazy var stackTopTravelInformation: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .horizontal
        return stack
    }()
    
    private(set) lazy var stackBottomTravelInformation: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 10
        stack.axis = .horizontal
        return stack
    }()
    
    // MARK: - ViewCode Protocol
    func buildViewHierachy() {
        addSubview(headerView)
        addSubview(stackTravelInformation)
        addSubview(stackSeats)
        addSubview(stackMain)
        addSubview(buyButton)
        
        
        headerView.addSubview(departureCityLabel)
        headerView.addSubview(arrowDestination)
        headerView.addSubview(arriveCityLabel)

        stackTravelInformation.addArrangedSubview(stackTopTravelInformation)
        stackTravelInformation.addArrangedSubview(stackBottomTravelInformation)

        stackTopTravelInformation.addArrangedSubview(BusCompanyNameText)
        stackTopTravelInformation.addArrangedSubview(hourDepartureText)
        stackBottomTravelInformation.addArrangedSubview(quantatySeatText)
        stackBottomTravelInformation.addArrangedSubview(priceText)
        
        stackSeats.addArrangedSubview(busySeatTextField)
        stackSeats.addArrangedSubview(availableSeatTextField)
        stackSeats.addArrangedSubview(selectedSeatTextField)
        
        stackMain.addArrangedSubview(collectionLeft)
        stackMain.addArrangedSubview(collectionRight)
        
    }
    
    func setupConstraints() {
        
        headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        stackTravelInformation.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -40).isActive = true
        stackTravelInformation.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        stackTravelInformation.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -30).isActive = true
        stackTravelInformation.heightAnchor.constraint(equalToConstant: 80).isActive = true
                
        stackTopTravelInformation.leftAnchor.constraint(equalTo: stackTravelInformation.leftAnchor, constant: 20).isActive = true
        stackBottomTravelInformation.leftAnchor.constraint(equalTo: stackTravelInformation.leftAnchor, constant: 20).isActive = true
        
        stackSeats.topAnchor.constraint(equalTo: stackTravelInformation.bottomAnchor, constant: 18).isActive = true
        stackSeats.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 18).isActive = true
        stackSeats.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -18).isActive = true
        stackSeats.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        stackMain.widthAnchor.constraint(equalToConstant: 300).isActive = true
        stackMain.topAnchor.constraint(equalTo: stackSeats.bottomAnchor, constant: 10).isActive = true
        stackMain.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackMain.bottomAnchor.constraint(equalTo: buyButton.topAnchor, constant: -18).isActive = true
        
        buyButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        buyButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 18).isActive = true
        buyButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -18).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
        departureCityLabel.rightAnchor.constraint(equalTo: arrowDestination.leftAnchor, constant: -18).isActive = true
        departureCityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        departureCityLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor,constant: 30).isActive = true
        arrowDestination.widthAnchor.constraint(equalToConstant: 25).isActive = true
        arrowDestination.heightAnchor.constraint(equalToConstant: 25).isActive = true
        arrowDestination.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        arriveCityLabel.leftAnchor.constraint(equalTo: arrowDestination.rightAnchor, constant: 18).isActive = true
        arriveCityLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -30).isActive = true
    }
    
    func addictionalConfiguration() {
        backgroundColor = .systemGray6
    }
    
    // MARK: - UpdateView
    func updateViewInformation(with bus: Bus) {
        self.BusCompanyNameText.text = bus.companyName
        self.hourDepartureText.text = bus.travel.arriveTime
        self.priceText.text = "R$: \(String(describing: bus.travel.value ?? 0.0))"
        self.hourDepartureText.text = bus.travel.departureTime?.getShortDate()
        self.departureCityLabel.text = bus.travel.departure.name
        self.arriveCityLabel.text = bus.travel.destination.name
    }
    
    // MARK: - public function
    func buyButtonTarget(_ target: Any, action: Selector) {
        buyButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func setupCollections(delegate: (UICollectionViewDelegate & UICollectionViewDataSource)) {
        collectionLeft.delegate = delegate
        collectionLeft.dataSource = delegate
        collectionLeft.register(SeatCollectionViewCell.self, forCellWithReuseIdentifier: SeatsConstants.collectionViewCellIdentifier)
        
        collectionRight.delegate = delegate
        collectionRight.dataSource = delegate
        collectionRight.register(SeatCollectionViewCell.self, forCellWithReuseIdentifier: SeatsConstants.collectionViewCellIdentifier)
    }
}
