//
//  PromotionCollectionViewCell.swift
//  BusBooking
//
//  Created by Jose Augusto on 28/03/23.
//

import UIKit

class PromotionCollectionViewCell: UICollectionViewCell, ViewCodeProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private(set) var cityImage: UIImage = {
        let image = UIImage(named: "chair")
        return image!
    }()
    
    private(set) var cityName: UILabel = {
        let name = UILabel()
        name.text = "Bragança Paulista"
        name.font = UIFont.systemFont(ofSize: 20)
        return name
    }()
    
    private(set) var valueText: UILabel = {
        let value = UILabel()
        value.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        value.text = "R$ 100"
        return value
    }()
    
    private(set) lazy var stackPromotion: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
        return stack
    }()
    
    func buildViewHierachy() {
        addSubview(stackPromotion)
        stackPromotion.addArrangedSubview(cityName)
        stackPromotion.addArrangedSubview(cityName)
        stackPromotion.addArrangedSubview(valueText)
    }
    
    func setupConstraints() {
        stackPromotion.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackPromotion.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
    }
    
    func addictionalConfiguration() {
        
    }
    
}
