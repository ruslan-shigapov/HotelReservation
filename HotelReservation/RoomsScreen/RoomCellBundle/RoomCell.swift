//
//  RoomCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 19.12.2023.
//

import UIKit
import Combine

final class RoomCell: VerticalCollectionViewCell {
    
    // MARK: Views
    private let imageSlider = ImageSliderView()
    private let cellTitleLabel = CellTitleLabel()
    let peculiaritiesView = PeculiaritiesView()
    private let priceView = PriceView()
    
    private lazy var confirmButton: UIButton = {
        let button = ConfirmButton(
            title: Constants.Text.ButtonTitle.chooseRoom
        )
        button.addTarget(
            self,
            action: #selector(confirmButtonWasPressed),
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var contentStackView: UIStackView = {
        let innerStackView = UIStackView(
            arrangedSubviews: [imageSlider, cellTitleLabel, peculiaritiesView]
        )
        innerStackView.axis = .vertical
        innerStackView.spacing = 8
        
        let stackView = UIStackView(
            arrangedSubviews: [innerStackView, priceView, confirmButton]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    // MARK: Properties
    private var storage: Set<AnyCancellable> = []
    
    var viewModel: RoomCellViewModel! {
        didSet {
            cellTitleLabel.configure(with: viewModel.roomName)
            peculiaritiesView.viewModel = viewModel.getPeculiaritiesViewModel()
            priceView.configure(
                withPrice: viewModel.price,
                description: viewModel.priceDescription
            )
            viewModel.$imageViews
                .sink { [weak self] in
                    self?.imageSlider.configure(with: $0)
                }
                .store(in: &storage)
        }
    }
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: .zero)
        peculiaritiesView.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    private func setupUI() {
        addSubview(contentStackView)
        setConstraints()
    }
    
    @objc private func confirmButtonWasPressed() {
        viewModel?.confirmButtonTapPublisher.send()
    }
}

// MARK: - Layout
private extension RoomCell {
    
    func setConstraints() {
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
