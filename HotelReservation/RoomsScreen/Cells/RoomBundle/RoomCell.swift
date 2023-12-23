//
//  RoomCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 19.12.2023.
//

import UIKit
import Combine

private enum PeculiarityCellType: String {
    case common
    case details
}

final class RoomCell: VerticalCollectionViewCell {
    
    // MARK: Views
    private lazy var imageSlider = ImageSliderView()
    private lazy var roomTitleLabel = CellTitleLabel()
    
    lazy var peculiaritiesCollectionView: UICollectionView = {
        let collectionView = PeculiaritiesCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(
            CommonPeculiarityCell.self,
            forCellWithReuseIdentifier: PeculiarityCellType.common.rawValue
        )
        collectionView.register(
            DetailsPeculiarityCell.self,
            forCellWithReuseIdentifier: PeculiarityCellType.details.rawValue
        )
        return collectionView
    }()
    
    private lazy var priceView = PriceView()
    
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
    
    private lazy var containerStackView: UIStackView = {
        let innerStackView = UIStackView(
            arrangedSubviews: [imageSlider, roomTitleLabel, peculiaritiesCollectionView]
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
            viewModel.$imageViews
                .sink { [weak self] in
                    self?.imageSlider.configure(with: $0)
                }
                .store(in: &storage)
            
            roomTitleLabel.configure(with: viewModel.roomName)
            viewModel.$peculiarities
                .sink { [weak self] _ in
                    self?.peculiaritiesCollectionView.reloadData()
                    self?.peculiaritiesCollectionView.layoutIfNeeded()
                }
                .store(in: &storage)
            
            priceView.configure(
                withPrice: viewModel.price,
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
    
    @objc private func confirmButtonWasPressed() {
        viewModel?.confirmButtonTapPublisher.send()
    }
}

// MARK: - Collection View Data Source
extension RoomCell: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        viewModel.getNumberOfItems()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell: UICollectionViewCell?
        if indexPath.row + 1 < viewModel.getNumberOfItems() {
            let commonCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PeculiarityCellType.common.rawValue,
                for: indexPath
            ) as? CommonPeculiarityCell
            commonCell?.configure(
                with: viewModel.peculiarities[indexPath.item]
            )
            cell = commonCell
        } else {
            let detailsCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PeculiarityCellType.details.rawValue,
                for: indexPath
            ) as? DetailsPeculiarityCell
            cell = detailsCell
        }
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - Layout
extension RoomCell {
    
    private func setConstraints() {
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
