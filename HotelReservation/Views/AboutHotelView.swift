//
//  AboutHotelView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 20.12.2023.
//

import UIKit

final class AboutHotelView: UIView {
    
    private let ratingView = RatingView()
    private let hotelNameLabel = CellTitleLabel()
    
    private lazy var addressButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(Constants.Colors.customBlue, for: .normal)
        button.titleLabel?.font = Constants.Fonts.sf14Medium
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubviews()
        subviews.forEach(prepareForAutoLayout)
        setConstraints()
    }
    
    private func addSubviews() {
        addSubview(ratingView)
        addSubview(hotelNameLabel)
        addSubview(addressButton)
    }
    
    private func prepareForAutoLayout(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: topAnchor),
            ratingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            hotelNameLabel.topAnchor.constraint(
                equalTo: ratingView.bottomAnchor,
                constant: 8
            ),
            hotelNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            hotelNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            addressButton.topAnchor.constraint(
                equalTo: hotelNameLabel.bottomAnchor,
                constant: 8
            ),
            addressButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            addressButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(withRating rating: String, name: String, address: String) {
        ratingView.configure(with: rating)
        hotelNameLabel.text = name
        addressButton.setTitle(address, for: .normal)
    }
}
