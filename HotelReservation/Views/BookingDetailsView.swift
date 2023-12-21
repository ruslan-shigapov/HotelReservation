//
//  BookingDetailsView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 21.12.2023.
//

import UIKit

final class BookingDetailsView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.customGray
        return label
    }()
    
    private let valueLabel = UILabel()
    
    private lazy var contentStackView: UIStackView = {
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
        addSubview(contentStackView)
        setConstraints()
        
        contentStackView.arrangedSubviews.forEach { label in
            if let label = label as? UILabel {
                label.font = Constants.Fonts.sf16Regular
                label.numberOfLines = 0
            }
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func configure(withTitle title: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
    }
}
