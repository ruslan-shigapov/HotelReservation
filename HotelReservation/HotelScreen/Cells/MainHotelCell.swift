//
//  MainHotelCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 15.12.2023.
//

import UIKit
import Combine

final class MainHotelCell: CustomCollectionViewCell {
    
    private let imageSlider = ImageSliderView()
    private let aboutHotelView = AboutHotelView()
    private let priceView = PriceView()
    
    private var storage: Set<AnyCancellable> = []
    
    weak var viewModel: MainHotelCellViewModel! {
        didSet {
            aboutHotelView.configure(
                withRating: viewModel.rating,
                name: viewModel.hotelName,
                address: viewModel.address
            )
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
        addSubview(aboutHotelView)
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

            aboutHotelView.topAnchor.constraint(
                equalTo: imageSlider.bottomAnchor
            ),
            aboutHotelView.leadingAnchor.constraint(equalTo: leadingAnchor),
            aboutHotelView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            priceView.topAnchor.constraint(equalTo: aboutHotelView.bottomAnchor),
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
