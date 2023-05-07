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
    
    private(set) var cityImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        let image = UIImage(named: "chair")
        imageView.image = image
        return imageView
    }()
    
    private(set) var cityName: UILabel = {
        let name = UILabel()
        name.text = "Bragança Paulista"
        name.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        name.textColor = .white
        return name
    }()
    
    private(set) var valueText: UILabel = {
        let value = UILabel()
        value.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        value.text = "R$ 100"
        value.textColor = .darkText
        return value
    }()
    
    private(set) lazy var stackPromotion: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .horizontal
        stack.alignment = .lastBaseline
        stack.spacing = 5
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 10
        stack.backgroundColor = Colors.mainColor.withAlphaComponent(0.7)
        return stack
    }()
    
    func buildViewHierachy() {
        addSubview(cityImage)
        addSubview(stackPromotion)
        stackPromotion.addArrangedSubview(cityName)
        stackPromotion.addArrangedSubview(valueText)
    }
    
    func setupConstraints() {
        stackPromotion.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackPromotion.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackPromotion.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackPromotion.topAnchor.constraint(equalTo: cityImage.bottomAnchor, constant: -30).isActive = true
    }
    
    func addictionalConfiguration() {
        
    }
    
    func configurePromotionCell(with promotion: Promotion) {
        if let url = URL(string: promotion.image){
            let image = UIImage()
            Task {
                self.cityImage.image = try await image.loadImageData(url)
            }
            self.cityName.text = promotion.name
            self.valueText.text = "R$ \(promotion.price)"
        }
    }
    
}
