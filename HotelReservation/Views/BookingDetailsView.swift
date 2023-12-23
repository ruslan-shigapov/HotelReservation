//
//  BookingDetailsView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 21.12.2023.
//

import UIKit

final class BookingDetailsView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.customGray
        return label
    }()
    
    private let valueLabel = UILabel()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, valueLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
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
        addSubview(containerStackView)
        setConstraints()
        
        containerStackView.arrangedSubviews.forEach { label in
            if let label = label as? UILabel {
                label.font = Constants.Fonts.sf16Regular
                label.numberOfLines = 0
            }
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor
            ),
        ])
    }
    
    func configure(
        withTitle title: String, 
        value: String,
        isPriceLabels: Bool = false,
        textColor: UIColor? = nil
    ) {
        titleLabel.text = title
        valueLabel.text = value
        
        if isPriceLabels {
            valueLabel.textAlignment = .right
        }
        
        if let color = textColor {
            valueLabel.textColor = color
            valueLabel.font = Constants.Fonts.sf16Semibold
        }
    }
}
