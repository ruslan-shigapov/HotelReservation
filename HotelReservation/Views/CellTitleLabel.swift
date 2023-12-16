//
//  CellTitleLabel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 16.12.2023.
//

import UIKit

final class CellTitleLabel: UILabel {

    init(title: String) {
        super.init(frame: .zero)
        text = title
        font = Constants.Fonts.sf22Medium
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
