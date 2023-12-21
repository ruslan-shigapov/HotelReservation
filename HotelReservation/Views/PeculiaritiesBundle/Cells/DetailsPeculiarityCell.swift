//
//  DetailsPeculiarityCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 19.12.2023.
//

import UIKit

final class DetailsPeculiarityCell: UICollectionViewCell {
    
    private lazy var detailsButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        let icon = Constants.Images.blueArrowNext
        configuration.image = icon
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 10
        var container = AttributeContainer()
        container.font = Constants.Fonts.sf16Medium
        configuration.attributedTitle = AttributedString(
            Constants.Text.roomDetails,
            attributes: container
        )
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
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
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            detailsButton.topAnchor.constraint(equalTo: topAnchor),
            detailsButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailsButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            detailsButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
