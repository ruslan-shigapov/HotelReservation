//
//  PriceView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 16.12.2023.
//

import UIKit

final class PriceView: UIView {

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.Fonts.sf30Semibold
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.Fonts.sf16Regular
        label.textColor = Constants.Colors.customGray
        return label
    }()

    init(priceText: String, descriptionText: String) {
        super.init(frame: .zero)
        priceLabel.text = priceText
        descriptionLabel.text = descriptionText
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(priceLabel)
        addSubview(descriptionLabel)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            descriptionLabel.leadingAnchor.constraint(
                equalTo: priceLabel.trailingAnchor,
                constant: 8
            ),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -3
            ),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
