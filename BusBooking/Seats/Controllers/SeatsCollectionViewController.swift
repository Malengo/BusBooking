//
//  SeatsCollectionViewController.swift
//  BusBooking
//
//  Created by user on 06/09/22.
//

import UIKit

class SeatsCollectionViewController: UICollectionViewController {
    
    var contador = 0
    var seatsViewModel: SeatsViewModel?
    
    lazy var collection: SeatsView = {
        var view = SeatsView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.setupCollections(delegate: self)
        collection.buyButtonTarget(self, action: #selector(buyTicket))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    override func loadView() {
        collection.setupView()
        view = collection
    }
    // MARK: - Private Methods
    private func updateView() {
        guard let bus = seatsViewModel?.bus else { return }
        collection.updateViewInformation(with: bus)
    }
    
    @objc private func buyTicket() {
        seatsViewModel?.selectedSeats { seats in
            for seat in seats {
                print(seat)
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ((seatsViewModel?.bus.seats.count ?? 0) / 2) / 2
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeatsConstants.collectionViewCellIdentifier, for: indexPath) as? SeatCollectionViewCell else { return UICollectionViewCell()   }
        
        let isLeft = collection.collectionLeft == collectionView ? true : false
        
        seatsViewModel?.isSeatOccuped(at: indexPath.section, and: indexPath.row, on: isLeft) { seat, position in
            cell.setIsSeatOccuped(seat.isOccuped)
            
            if seat.isSelected {
                cell.setSelectedSeat()
            }
            
            cell.seatNumberText.text = String(position)
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SeatCollectionViewCell {
            self.selectedSeat(at: cell)
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SeatCollectionViewCell {
            self.selectedSeat(at: cell)
        }
    }
    
    private func selectedSeat(at cell: SeatCollectionViewCell) {
        guard let position = Int(cell.seatNumberText.text!) else { return }
        guard let seat = seatsViewModel?.getSeat(at: position) else { return }
        guard !seat.isOccuped else { return }
        
        if contador < 2 {
            if seat.isSelected {
                seatsViewModel?.setSeat(at: position, as: false)
                cell.setAvalibleColor()
                contador -= 1
            } else {
                seatsViewModel?.setSeat(at: position, as: true)
                cell.setSelectedSeat()
                contador += 1
            }
        } else if seat.isSelected {
            seatsViewModel?.setSeat(at: position, as: false)
            cell.setAvalibleColor()
            contador -= 1
        }
    }
}
