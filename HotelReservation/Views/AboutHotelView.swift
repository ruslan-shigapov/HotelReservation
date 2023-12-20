//
//  AboutHotelView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 20.12.2023.
//

import UIKit

final class AboutHotelView: UIView {
    
    private lazy var starImageView: UIImageView = {
        let imageView = UIImageView(image: Constants.Images.star)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.Fonts.sf16Medium
        label.textColor = Constants.Colors.customGold
        return label
    }()
    
    private lazy var ratingView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.backgroundGold
        view.addSubview(starImageView)
        view.addSubview(ratingLabel)
        view.layer.cornerRadius = 5
        return view
    }()
    
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
    
    func configure(withRating rating: String, name: String, address: String) {
        ratingLabel.text = rating
        hotelNameLabel.text = name
        addressButton.setTitle(address, for: .normal)
    }
}

// MARK: - Layout
private extension AboutHotelView {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            ratingView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            
            starImageView.centerYAnchor.constraint(
                equalTo: ratingView.centerYAnchor
            ),
            starImageView.leadingAnchor.constraint(
                equalTo: ratingView.leadingAnchor,
                constant: 10
            ),

            ratingLabel.topAnchor.constraint(
                equalTo: ratingView.topAnchor,
                constant: 5
            ),
            ratingLabel.leadingAnchor.constraint(
                equalTo: starImageView.trailingAnchor,
                constant: 2
            ),
            ratingLabel.bottomAnchor.constraint(
                equalTo: ratingView.bottomAnchor,
                constant: -5
            ),
            ratingLabel.trailingAnchor.constraint(
                equalTo: ratingView.trailingAnchor,
                constant: -10
            ),
            
            hotelNameLabel.topAnchor.constraint(
                equalTo: ratingView.bottomAnchor,
                constant: 8
            ),
            hotelNameLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            hotelNameLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            
            addressButton.topAnchor.constraint(
                equalTo: hotelNameLabel.bottomAnchor,
                constant: 8
            ),
            addressButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            addressButton.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -16
            )
        ])
    }
}
