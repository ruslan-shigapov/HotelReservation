//
//  AboutHotelCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 20.12.2023.
//

import UIKit

final class AboutHotelCell: VerticalCollectionViewCell {
    
    private lazy var aboutHotelView = AboutHotelView()
    
    weak var viewModel: AboutHotelCellViewModel! {
        didSet {
            aboutHotelView.configure(
                withRating: viewModel.rating,
                name: viewModel.hotelName,
                address: viewModel.address
            )
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        aboutHotelView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(aboutHotelView)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            aboutHotelView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 16
            ),
            aboutHotelView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            aboutHotelView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -16
            ),
            aboutHotelView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            )
        ])
    }
}
