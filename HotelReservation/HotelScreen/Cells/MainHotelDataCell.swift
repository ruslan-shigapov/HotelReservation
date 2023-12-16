//
//  MainHotelDataCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 15.12.2023.
//

import UIKit

class MainHotelDataCell: UICollectionViewCell {
    
    private lazy var ratingView = RatingView()
    private lazy var priceView = PriceView(
        priceText: "от 134 673 \u{20BD}",
        descriptionText: "за тур с перелётом"
    )
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        layer.cornerRadius = 12
        addSubview(ratingView)
        addSubview(priceView)
        subviews.forEach(prepareForAutoLayout)
        setConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareForAutoLayout(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            ratingView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            
            priceView.topAnchor.constraint(
                equalTo: ratingView.bottomAnchor,
                constant: 16
            ),
            priceView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            priceView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -16
            )
        ])
    }
}
