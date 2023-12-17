//
//  AddressButton.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 16.12.2023.
//

import UIKit

final class AddressButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        setTitleColor(Constants.Colors.customBlue, for: .normal)
        titleLabel?.font = Constants.Fonts.sf14Medium
    }
    
    func configure(with title: String) {
        setTitle(title, for: .normal)
    }
}
