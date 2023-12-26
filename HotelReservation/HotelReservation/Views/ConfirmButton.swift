//
//  ConfirmButton.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 16.12.2023.
//

import UIKit

final class ConfirmButton: UIButton {

    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = Constants.Colors.customBlue
        setTitleColor(.systemBackground, for: .normal)
        titleLabel?.font = Constants.Fonts.sf16Medium
        layer.cornerRadius = 15
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
