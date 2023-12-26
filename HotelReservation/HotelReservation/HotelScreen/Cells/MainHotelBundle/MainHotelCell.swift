//
//  MainHotelCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 15.12.2023.
//

import UIKit
import Combine

final class MainHotelCell: VerticalCollectionViewCell {
    
    // MARK: Views
    private lazy var imageSliderView = ImageSliderView()
    private lazy var aboutHotelView = AboutHotelView()
    private lazy var priceView = PriceView()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [imageSliderView, aboutHotelView, priceView]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    // MARK: Properties
    private var storage: Set<AnyCancellable> = []
    
    weak var viewModel: MainHotelCellViewModel! {
        didSet {
            viewModel.$imageViews
                .sink { [weak self] in
                    self?.imageSliderView.configure(with: $0)
                }
                .store(in: &storage)
            
            aboutHotelView.configure(
                withRating: viewModel.rating,
                name: viewModel.hotelName,
                address: viewModel.address
            )
            priceView.configure(
                withPrice: viewModel.minimalPrice,
                description: viewModel.priceDescription
            )
        }
    }
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private Methods
    private func setupUI() {
        addSubview(containerStackView)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 10
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
