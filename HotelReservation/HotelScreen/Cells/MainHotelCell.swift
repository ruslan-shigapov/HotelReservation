//
//  MainHotelCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 15.12.2023.
//

import UIKit

final class MainHotelCell: UICollectionViewCell {
    
    // MARK: Views
    private let imageSlider = ImageSlider()
    private let ratingView = RatingView()
    private let cellTitleLabel = CellTitleLabel()
    private let addressButton = AddressButton()
    private let priceView = PriceView()
    
    // MARK: View Model
    var viewModel: MainHotelCellViewModelProtocol! {
        didSet {
            imageSlider.configure(with: viewModel.imageViews)
            ratingView.configure(with: viewModel.rating)
            cellTitleLabel.configure(with: viewModel.hotelName)
            addressButton.configure(with: viewModel.address)
            priceView.configure(
                with: viewModel.price,
                and: viewModel.priceDescription
            )
        }
    }
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    private func setupUI() {
        backgroundColor = .systemBackground
        addSubviews()
        subviews.forEach(prepareForAutoLayout)
        layer.cornerRadius = 12
        setConstraints()
    }
    
    private func addSubviews() {
        addSubview(imageSlider)
        addSubview(ratingView)
        addSubview(cellTitleLabel)
        addSubview(addressButton)
        addSubview(priceView)
    }
    
    private func prepareForAutoLayout(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Layout
private extension MainHotelCell {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageSlider.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageSlider.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            imageSlider.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            
            ratingView.topAnchor.constraint(
                equalTo: imageSlider.bottomAnchor,
                constant: 16
            ),
            ratingView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            
            cellTitleLabel.topAnchor.constraint(
                equalTo: ratingView.bottomAnchor,
                constant: 8
            ),
            cellTitleLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            cellTitleLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            
            addressButton.topAnchor.constraint(
                equalTo: cellTitleLabel.bottomAnchor,
                constant: 8
            ),
            addressButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            
            priceView.topAnchor.constraint(
                equalTo: addressButton.bottomAnchor,
                constant: 16
            ),
            priceView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            priceView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -16
            )
        ])
    }
}
