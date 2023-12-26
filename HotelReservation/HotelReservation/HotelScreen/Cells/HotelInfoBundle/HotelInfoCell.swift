//
//  HotelInfoCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 17.12.2023.
//

import UIKit
import Combine

private enum PeculiarityCellType: String {
    case common
}

final class HotelInfoCell: VerticalCollectionViewCell {
    
    // MARK: Views
    private lazy var cellTitleLabel: UILabel = {
        let label = CellTitleLabel()
        label.configure(with: Constants.Text.CellTitle.aboutHotel)
        return label
    }()
    
    private lazy var peculiaritiesCollectionView: UICollectionView = {
        let collectionView = PeculiaritiesCollectionView()
        collectionView.dataSource = self
        collectionView.register(
            CommonPeculiarityCell.self,
            forCellWithReuseIdentifier: PeculiarityCellType.common.rawValue
        )
        return collectionView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Constants.Fonts.sf16Regular
        return label
    }()
        
    private let infoButtonsView = InfoButtonsView()
    
    private lazy var containerStackView: UIStackView = {
        let innerStackView = UIStackView(
            arrangedSubviews: [peculiaritiesCollectionView, descriptionLabel]
        )
        innerStackView.axis = .vertical
        innerStackView.spacing = 12
        
        let stackView = UIStackView(
            arrangedSubviews: [cellTitleLabel, innerStackView, infoButtonsView]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    // MARK: Properties
    private var storage: Set<AnyCancellable> = []
    
    weak var viewModel: HotelInfoCellViewModel! {
        didSet {
            viewModel.$peculiarities
                .sink { [weak self] _ in
                    self?.peculiaritiesCollectionView.reloadData()
                    self?.peculiaritiesCollectionView.layoutIfNeeded()
                }
                .store(in: &storage)
            
            descriptionLabel.text = viewModel.description
        }
    }
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup
    private func setupUI() {
        addSubview(containerStackView)
        setConstraints()
    }
}

// MARK: - Collection View Data Source
extension HotelInfoCell: UICollectionViewDataSource {
    
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
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PeculiarityCellType.common.rawValue,
            for: indexPath
        ) as? CommonPeculiarityCell
        cell?.configure(
            with: viewModel.peculiarities[indexPath.item]
        )
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - Layout
private extension HotelInfoCell {
    
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
            ),
            // TODO: make auto
            peculiaritiesCollectionView.heightAnchor.constraint(equalToConstant: 107)
        ])
    }
}
