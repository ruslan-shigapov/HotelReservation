//
//  MainHotelCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 15.12.2023.
//

import UIKit
import Combine

final class MainHotelCell: VerticalCollectionViewCell {
    
    private let imageSlider = ImageSliderView()
    private let aboutHotelView = AboutHotelView()
    private let priceView = PriceView()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [imageSlider, aboutHotelView, priceView]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private var storage: Set<AnyCancellable> = []
    
    weak var viewModel: MainHotelCellViewModel! {
        didSet {
            aboutHotelView.configure(
                withRating: viewModel.rating,
                name: viewModel.hotelName,
                address: viewModel.address
            )
            priceView.configure(
                withPrice: viewModel.minimalPrice,
                description: viewModel.priceDescription
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
        addSubview(contentStackView)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 10
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
