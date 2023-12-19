//
//  DetailsPeculiarityCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 19.12.2023.
//

import UIKit

final class DetailsPeculiarityCell: UICollectionViewCell {
    
    private lazy var detailsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.Text.roomDetails, for: .normal)
        button.setTitleColor(Constants.Colors.customBlue, for: .normal)
        button.titleLabel?.font = Constants.Fonts.sf16Medium
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
        backgroundColor = Constants.Colors.backgroundBlue
        addSubview(detailsButton)
        layer.cornerRadius = 5
        setConstraints()
    }
}

// MARK: - Layout
private extension DetailsPeculiarityCell {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            detailsButton.topAnchor.constraint(equalTo: topAnchor),
            detailsButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 10
            ),
            detailsButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            detailsButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -10
            )
        ])
    }
}
