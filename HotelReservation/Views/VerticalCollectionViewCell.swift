//
//  VerticalCollectionViewCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 19.12.2023.
//

import UIKit

class VerticalCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 12
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        let widthAnchor = widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width
        )
        widthAnchor.priority = .defaultHigh
        widthAnchor.isActive = true
    }
}