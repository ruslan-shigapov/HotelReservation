//
//  RatingView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 16.12.2023.
//

import UIKit

final class RatingView: UIView {
    
    private lazy var starImageView: UIImageView = {
        let imageView = UIImageView(image: Constants.Images.star)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "5 Превосходно"
        label.font = Constants.Fonts.sf16Medium
        label.textColor = Constants.Colors.gold
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = Constants.Colors.lightGold
        addSubview(starImageView)
        addSubview(ratingLabel)
        layer.cornerRadius = 5
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            starImageView.heightAnchor.constraint(equalToConstant: 15),
            starImageView.widthAnchor.constraint(equalToConstant: 15),
            starImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 10
            ),
            starImageView.centerYAnchor.constraint(equalTo: centerYAnchor),

            ratingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            ratingLabel.leadingAnchor.constraint(
                equalTo: starImageView.trailingAnchor,
                constant: 2
            ),
            ratingLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -5
            ),
            ratingLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -10
            )
        ])
    }
}
