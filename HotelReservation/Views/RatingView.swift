//
//  RatingView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 21.12.2023.
//

import UIKit

final class RatingView: UIView {
    
    private let starImageView = UIImageView(image: Constants.Images.star)
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.sf16Medium
        label.textColor = Constants.Colors.customGold
        return label
    }()

    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [starImageView, ratingLabel]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 2
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = Constants.Colors.backgroundGold
        addSubview(containerStackView)
        layer.cornerRadius = 5
        setConstraints()
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([            
            containerStackView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 5
            ),
            containerStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 10
            ),
            containerStackView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -5
            ),
            containerStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -10
            )
        ])
    }
    
    func configure(with title: String) {
        ratingLabel.text = title
    }
}
