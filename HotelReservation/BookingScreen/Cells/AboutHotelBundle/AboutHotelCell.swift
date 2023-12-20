//
//  AboutHotelCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 20.12.2023.
//

import UIKit

final class AboutHotelCell: CustomCollectionViewCell {
    
    private let aboutHotelView = AboutHotelView()
    
    weak var viewModel: AboutHotelCellViewModel! {
        didSet {
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(aboutHotelView)
        aboutHotelView.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            aboutHotelView.topAnchor.constraint(equalTo: topAnchor),
            aboutHotelView.leadingAnchor.constraint(equalTo: leadingAnchor),
            aboutHotelView.bottomAnchor.constraint(equalTo: bottomAnchor),
            aboutHotelView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
