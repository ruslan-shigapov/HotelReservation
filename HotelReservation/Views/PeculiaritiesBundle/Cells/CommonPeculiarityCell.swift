//
//  CommonPeculiarityCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 18.12.2023.
//

import UIKit

final class CommonPeculiarityCell: UICollectionViewCell {
    
    private lazy var peculiarityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.Fonts.sf16Medium
        label.textColor = Constants.Colors.customGray
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
        backgroundColor = Constants.Colors.backgroundGray
        addSubview(peculiarityLabel)
        layer.cornerRadius = 5
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            peculiarityLabel.topAnchor.constraint(equalTo: topAnchor),
            peculiarityLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 10
            ),
            peculiarityLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            peculiarityLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -10
            )
        ])
    }
    
    func configure(with title: String) {
        peculiarityLabel.text = title.replacingOccurrences(
            of: "Wifi",
            with: "Wi-Fi"
        )
    }
}
