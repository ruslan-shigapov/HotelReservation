//
//  DetailsLabelsView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 21.12.2023.
//

import UIKit

final class DetailsLabelsView: UIView {

    private let departureLabel = UILabel()
    private let arrivalCountryLabel = UILabel()
    private let datesLabel = UILabel()
    private let numberOfNightsLabel = UILabel()
    private let hotelNameLabel = UILabel()
    private let roomLabel = UILabel()
    private let nutritionLabel = UILabel()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            departureLabel,
            arrivalCountryLabel,
            datesLabel,
            numberOfNightsLabel,
            hotelNameLabel,
            roomLabel,
            nutritionLabel
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    init(color: UIColor) {
        super.init(frame: .zero)
        
        contentStackView.arrangedSubviews.forEach { label in
            if let label = label as? UILabel {
                label.textColor = color
                label.font = Constants.Fonts.sf16Regular
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(contentStackView)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configure(
        withDeparture departure: String,
        arrivalCountry: String,
        dates: String,
        numberOfNights: String,
        hotelName: String,
        room: String,
        nutrition: String
    ) {
        departureLabel.text = departure
        arrivalCountryLabel.text = arrivalCountry
        datesLabel.text = dates
        numberOfNightsLabel.text = numberOfNights
        hotelNameLabel.text = hotelName
        roomLabel.text = room
        nutritionLabel.text = room
    }
}
