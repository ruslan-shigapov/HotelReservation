//
//  MainHotelCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 15.12.2023.
//

import UIKit
import Combine

final class MainHotelCell: UICollectionViewCell {
    
    private let imageSlider = ImageSliderView()
    private let ratingView = RatingView()
    private let cellTitleLabel = CellTitleLabel()
    private let addressButton = AddressButton()
    private let priceView = PriceView()
    
    private var storage: Set<AnyCancellable> = []
    
    var viewModel: MainHotelCellViewModel! {
        didSet {
            ratingView.configure(with: viewModel.rating)
            cellTitleLabel.configure(with: viewModel.hotelName)
            addressButton.configure(with: viewModel.address)
            priceView.configure(
                with: viewModel.minimalPrice,
                and: viewModel.priceDescription
            )
            viewModel.$imageViews
                .sink { [weak self] in
                    self?.imageSlider.configure(with: $0)
                }
                .store(in: &storage)
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
        addSubviews()
        subviews.forEach(prepareForAutoLayout)
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
            imageSlider.heightAnchor.constraint(equalToConstant: 257),
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
