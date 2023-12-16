//
//  AddressButton.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 16.12.2023.
//

import UIKit

final class AddressButton: UIButton {

    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        setTitleColor(Constants.Colors.customBlue, for: .normal)
        titleLabel?.font = Constants.Fonts.sf14Medium
    }
}
