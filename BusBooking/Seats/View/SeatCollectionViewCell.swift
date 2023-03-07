//
//  SeatCollectionViewCell.swift
//  BusBooking
//
//  Created by user on 08/09/22.
//

import UIKit

class SeatCollectionViewCell: UICollectionViewCell, ViewCodeProtocol {
        
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Components
    private(set) lazy var seatImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "chair")
        image.tintColor = .systemGray6
        return image
    }()
    
    private(set) lazy var seatNumberText: UITextField = {
        let text = UITextField()
        text.text = "A"
        text.textColor = .systemBlue
        text.font = UIFont.systemFont(ofSize: 15)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    // MARK: - ViewCode Protocol
    func buildViewHierachy() {
        addSubview(seatImage)
        seatImage.addSubview(seatNumberText)
    }
    
    func setupConstraints() {
        seatImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        seatImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        seatImage.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        seatImage.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        seatImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        seatImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        seatNumberText.centerXAnchor.constraint(equalTo: seatImage.centerXAnchor).isActive = true
        seatNumberText.topAnchor.constraint(equalTo: seatImage.topAnchor, constant: 8).isActive = true
        
    }
    
    func addictionalConfiguration() {
    }
    
    func setAvalibleColor() {
        seatImage.tintColor = Colors.avalibleSeatsColor
        seatNumberText.textColor = Colors.avalibleSeatsColor
    }
    
    func setSelectedSeat() {
        seatImage.tintColor = .red
        seatNumberText.textColor = .red
    }
    
    func setIsSeatOccuped(_ isOccuped: Bool) {
        seatImage.tintColor = isOccuped ? .systemGray3 : Colors.avalibleSeatsColor
        seatNumberText.textColor = isOccuped ? .systemGray3 : Colors.avalibleSeatsColor
    }
}
