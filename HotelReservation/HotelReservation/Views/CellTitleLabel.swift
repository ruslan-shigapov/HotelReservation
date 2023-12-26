//
//  CellTitleLabel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 16.12.2023.
//

import UIKit

final class CellTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        font = Constants.Fonts.sf22Medium
        numberOfLines = 0
    }
    
    func configure(with title: String) {
        text = title
    }
}
