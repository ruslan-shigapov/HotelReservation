//
//  BookingDetailsCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 21.12.2023.
//

import UIKit

final class BookingDetailsCell: VerticalCollectionViewCell {
    
    private let titleLabelsView = DetailsLabelsView(
        color: Constants.Colors.customGray
    )
    
    private let valueLabelsView = DetailsLabelsView(color: .label)
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [titleLabelsView, valueLabelsView]
        )       
        stackView.translatesAutoresizingMaskIntoConstraints = false
        titleLabelsView.configure(
            withDeparture: Constants.Text.departure,
            arrivalCountry: Constants.Text.arrivalCountry,
            dates: Constants.Text.dates,
            numberOfNights: Constants.Text.numberOfNights,
            hotelName: Constants.Text.hotelName,
            room: Constants.Text.room,
            nutrition: Constants.Text.nutrition
        )
        return stackView
    }()
    
    weak var viewModel: BookingDetailsCellViewModel! {
        didSet {
            valueLabelsView.configure(
                withDeparture: viewModel.departure,
                arrivalCountry: viewModel.arrivalCountry,
                dates: viewModel.dates,
                numberOfNights: viewModel.numberOfNights,
                hotelName: viewModel.hotelName,
                room: viewModel.room,
                nutrition: viewModel.nutrition
            )
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentStackView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 16
            ),
            contentStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            contentStackView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -16
            ),
            contentStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            )
        ])
    }
}
