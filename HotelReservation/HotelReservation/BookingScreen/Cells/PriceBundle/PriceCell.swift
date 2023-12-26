//
//  PriceCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 23.12.2023.
//

import UIKit

final class PriceCell: VerticalCollectionViewCell {
    
    private lazy var tourPriceLabelsView = BookingDetailsView()
    private lazy var fuelChargeLabelsView = BookingDetailsView()
    private lazy var serviceChargeLabelsView = BookingDetailsView()
    private lazy var totalPriceLabelsView = BookingDetailsView()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            tourPriceLabelsView,
            fuelChargeLabelsView,
            serviceChargeLabelsView,
            totalPriceLabelsView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    weak var viewModel: PriceCellViewModel! {
        didSet {
            tourPriceLabelsView.configure(
                withTitle: Constants.Text.tour,
                value: viewModel.tourPrice,
                isPriceLabels: true
            )
            fuelChargeLabelsView.configure(
                withTitle: Constants.Text.fuelCharge,
                value: viewModel.fuelCharge,
                isPriceLabels: true
            )
            serviceChargeLabelsView.configure(
                withTitle: Constants.Text.serviceCharge,
                value: viewModel.serviceCharge,
                isPriceLabels: true
            )
            totalPriceLabelsView.configure(
                withTitle: Constants.Text.totalPrice,
                value: viewModel.totalPrice,
                isPriceLabels: true,
                textColor: Constants.Colors.customBlue
            )
        }
    }
    
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
private extension PriceCell {
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
