//
//  MainHotelDataCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 15.12.2023.
//

import UIKit

class MainHotelDataCell: UICollectionViewCell {
    
    private lazy var imageSlider = ImageSlider(pages: [])
    private lazy var ratingView = RatingView()
    private lazy var cellTitleLabel = CellTitleLabel(
        title: "Steigenberger Makadi"
    )
    private lazy var addressButton = AddressButton(
        title: "Madinat Makadi, Safaga Road, Makadi Bay, Египет"
    )
    private lazy var priceView = PriceView(
        price: "от 134 673 \u{20BD}",
        description: "за тур с перелётом"
    )
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .systemBackground
        addSubviews()
        subviews.forEach(prepareForAutoLayout)
        layer.cornerRadius = 12
        setConstraints()
    }
    
    private func addSubviews() {
        addSubview(imageSlider)
        addSubview(ratingView)
        addSubview(cellTitleLabel)
        addSubview(addressButton)
        addSubview(priceView)
    }
    
    private func prepareForAutoLayout(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageSlider.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageSlider.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            imageSlider.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            
            ratingView.topAnchor.constraint(
                equalTo: imageSlider.bottomAnchor,
                constant: 16
            ),
            ratingView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            
            cellTitleLabel.topAnchor.constraint(
                equalTo: ratingView.bottomAnchor,
                constant: 8
            ),
            cellTitleLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            
            addressButton.topAnchor.constraint(
                equalTo: cellTitleLabel.bottomAnchor,
                constant: 8
            ),
            addressButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            
            priceView.topAnchor.constraint(
                equalTo: addressButton.bottomAnchor,
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
