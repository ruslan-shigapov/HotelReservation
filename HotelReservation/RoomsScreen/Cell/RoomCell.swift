//
//  RoomCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 19.12.2023.
//

import UIKit
import Combine

final class RoomCell: CustomCollectionViewCell {
    
    private let imageSlider = ImageSliderView()
    private let cellTitleLabel = CellTitleLabel()
    private let peculiaritiesView = PeculiaritiesView()
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
    
    private var storage: Set<AnyCancellable> = []
    
    weak var viewModel: RoomCellViewModel! {
        didSet {
            cellTitleLabel.configure(with: viewModel.roomName)
            peculiaritiesView.viewModel = viewModel.getPeculiaritiesViewModel()
            priceView.configure(
                with: viewModel.price,
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
        backgroundColor = .systemBackground
        addSubviews()
        subviews.forEach(prepareForAutoLayout)
        setConstraints()
    }
    
    private func addSubviews() {
        addSubview(imageSlider)
        addSubview(cellTitleLabel)
        addSubview(peculiaritiesView)
        addSubview(priceView)
        addSubview(confirmButton)
    }
    
    private func prepareForAutoLayout(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func confirmButtonWasPressed() {
        
    }
}

// MARK: - Layout
private extension RoomCell {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageSlider.heightAnchor.constraint(equalToConstant: 257),
            imageSlider.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageSlider.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            imageSlider.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            
            cellTitleLabel.topAnchor.constraint(
                equalTo: imageSlider.bottomAnchor,
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
            
            peculiaritiesView.topAnchor.constraint(
                equalTo: cellTitleLabel.bottomAnchor),
            peculiaritiesView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            peculiaritiesView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            
            priceView.topAnchor.constraint(
                equalTo: peculiaritiesView.bottomAnchor,
                constant: 16
            ),
            priceView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),

            confirmButton.topAnchor.constraint(
                equalTo: priceView.bottomAnchor,
                constant: 16
            ),
            confirmButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            confirmButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            confirmButton.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -16
            ),
        ])
    }
}
