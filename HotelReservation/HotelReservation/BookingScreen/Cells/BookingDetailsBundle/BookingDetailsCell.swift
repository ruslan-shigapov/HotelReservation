//
//  BookingDetailsCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 21.12.2023.
//

import UIKit

final class BookingDetailsCell: VerticalCollectionViewCell {
    
    // MARK: Views
    private lazy var departureLabelsView = BookingDetailsView()
    private lazy var arrivalCountryLabelsView = BookingDetailsView()
    private lazy var datesLabelsView = BookingDetailsView()
    private lazy var numberOfNightsLabelsView = BookingDetailsView()
    private lazy var hotelNameLabelsView = BookingDetailsView()
    private lazy var roomLabelsView = BookingDetailsView()
    private lazy var nutritionLabelsView = BookingDetailsView()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            departureLabelsView,
            arrivalCountryLabelsView,
            datesLabelsView,
            numberOfNightsLabelsView,
            hotelNameLabelsView,
            roomLabelsView,
            nutritionLabelsView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    // MARK: Binding
    weak var viewModel: BookingDetailsCellViewModel! {
        didSet {
            departureLabelsView.configure(
                withTitle: Constants.Text.departure,
                value: viewModel.departure
            )
            arrivalCountryLabelsView.configure(
                withTitle: Constants.Text.arrivalCountry,
                value: viewModel.arrivalCountry
            )
            datesLabelsView.configure(
                withTitle: Constants.Text.dates,
                value: viewModel.dates
            )
            numberOfNightsLabelsView.configure(
                withTitle: Constants.Text.numberOfNights,
                value: viewModel.numberOfNights
            )
            hotelNameLabelsView.configure(
                withTitle: Constants.Text.hotelName,
                value: viewModel.hotelName
            )
            roomLabelsView.configure(
                withTitle: Constants.Text.room,
                value: viewModel.room
            )
            nutritionLabelsView.configure(
                withTitle: Constants.Text.nutrition,
                value: viewModel.nutrition
            )
        }
    }
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerStackView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Layout
private extension BookingDetailsCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 16
            ),
            containerStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            containerStackView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -16
            ),
            containerStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            )
        ])
    }
}
