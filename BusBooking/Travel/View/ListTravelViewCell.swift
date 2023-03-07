//
//  ListTravelViewCell.swift
//  BusBooking
//
//  Created by user on 29/08/22.
//

import UIKit

class ListTravelViewCell: UITableViewCell, ViewCodeProtocol {
    // MARK: - Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Visual Components
    private(set) lazy var departureHourLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 12.0)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "12:00 PM"
        return label
    }()
    
    private(set) lazy var departureCityLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20.0)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Bragança"
        return label
    }()
    
    private(set) lazy var departureDateLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 12)
        label.text = "12 Nov 12:00"
        return label
    }()
    
    private(set) lazy var arriveCityLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20.0)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Bragança Paulista"
        return label
    }()
    
    private(set) lazy var arriveDateLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 12)
        label.text = "12 Nov 12:00"
        return label
    }()
    
    private(set) lazy var locationImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "location.fill")
        image.tintColor = UIColor(red: 105/255, green: 203/255, blue: 248/255, alpha: 255/255)
        image.layer.cornerRadius = 8
        return image
    }()
    
    private(set) lazy var destinationImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "mappin.and.ellipse")
        image.tintColor = UIColor(red: 198/255, green: 134/255, blue: 255/255, alpha: 255/255)
        image.layer.cornerRadius = 8
        return image
    }()
    
    private var views: [UIView] {
        var vc: [UIView] = []
        for _ in 1...4 {
            let view = UIView()
            view.backgroundColor = .systemGray5
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 3).isActive = true
            view.heightAnchor.constraint(equalToConstant: 5).isActive = true
            vc.append(view)
        }
        return vc
    }
    
    private var dotteds: [UIView] {
        var vc: [UIView] = []
        for _ in 1...8 {
            let view = UIView()
            view.backgroundColor = .systemGray5
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 3).isActive = true
            vc.append(view)
        }
        return vc
    }
    
    private(set) lazy var ball: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 20).isActive = true
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private(set) lazy var ballLast: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 20).isActive = true
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private(set) lazy var buyButton: UIButton = {
        var button = UIButton()
        button.setTitle("Comprar", for: .normal)
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        button.backgroundColor = UIColor(red: 255/255, green: 143/255, blue: 96/255, alpha: 255/255)
        return button
    }()
    
    private(set) lazy var priceLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 12.0)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "R$: 100,00"
        return label
    }()
    
    // MARK: - Stacks
    private(set) lazy var stackTravel: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private(set) lazy var stackDeparture: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 2
        return stack
    }()
    
    private(set) lazy var stackDepartureLabels: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    private(set) lazy var stackArrive: UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 18
        return stack
    }()
    
    private(set) lazy var stackArriveLabels: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    private(set) lazy var stackImage: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = 5
        stack.axis = .vertical
        return stack
    }()
    
    private(set) lazy var stackMain: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 10
        return stack
    }()
    
    private(set) lazy var separatorStack: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = 5
        stack.axis = .vertical
        return stack
    }()
    
    private(set) lazy var lastStack: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .vertical
        return stack
    }()

    // MARK: - ViewCode Protocol
    func buildViewHierachy() {
        addSubview(stackMain)
        addSubview(separatorStack)
        addSubview(lastStack)
        
        stackMain.addArrangedSubview(stackImage)
        stackMain.addArrangedSubview(stackTravel)
                
        stackTravel.addArrangedSubview(stackDeparture)
        stackTravel.addArrangedSubview(stackArrive)
        
        stackDeparture.addArrangedSubview(stackDepartureLabels)
        
        stackDepartureLabels.addArrangedSubview(departureCityLabel)
        stackDepartureLabels.addArrangedSubview(departureDateLabel)
        
        stackArrive.addArrangedSubview(stackArriveLabels)
        
        stackArriveLabels.addArrangedSubview(arriveCityLabel)
        stackArriveLabels.addArrangedSubview(arriveDateLabel)
        
        stackImage.addArrangedSubview(locationImage)
        views.forEach { view in stackImage.addArrangedSubview(view) }
        stackImage.addArrangedSubview(destinationImage)
        
        separatorStack.addArrangedSubview(ball)
        dotteds.forEach { separatorStack.addArrangedSubview($0)}
        separatorStack.addArrangedSubview(ballLast)
        
        lastStack.addArrangedSubview(departureHourLabel)
        lastStack.addArrangedSubview(buyButton)
        lastStack.addArrangedSubview(priceLabel)
      
    }
    
    func setupConstraints() {
        stackMain.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        stackMain.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 18).isActive = true
        stackMain.rightAnchor.constraint(equalTo: separatorStack.leftAnchor, constant: -5).isActive = true
        stackMain.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -18).isActive = true
        
        lastStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 18).isActive = true
        lastStack.leftAnchor.constraint(equalTo: separatorStack.rightAnchor).isActive = true
        lastStack.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -18).isActive = true
        lastStack.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        separatorStack.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        stackImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        locationImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
        destinationImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        destinationImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        ball.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -1).isActive = true
        ballLast.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 1).isActive = true
        
        departureHourLabel.centerXAnchor.constraint(equalTo: lastStack.centerXAnchor).isActive = true
    }
    
    func addictionalConfiguration() {
        layer.cornerRadius = 30
        clipsToBounds = true
    }
    
    func configureCellWith(_ travel: Travel) {
        departureHourLabel.text = travel.departureTime?.getShortHour()
        departureCityLabel.text = travel.departure.name
        departureDateLabel.text = travel.departureTime?.getShortDate()
        arriveCityLabel.text = travel.destination.name
        arriveDateLabel.text = travel.departureTime?.getShortDate()
    }
    
}
