//
//  PeculiaritiesView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 18.12.2023.
//

import UIKit
import Combine

private enum PeculiarityCellType: String {
    case common
    case details
}

final class PeculiaritiesView: UIView {

    // MARK: Views
    private lazy var horizontalCollectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: makeLayout()
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    // MARK: Properties
    private var storage: Set<AnyCancellable> = []
    
    var viewModel: PeculiaritiesViewModel! {
        didSet {
            viewModel.$peculiarities
                .sink { [weak self] _ in
                    self?.horizontalCollectionView.reloadData()
                }
                .store(in: &storage)
        }
    }
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        horizontalCollectionView.dataSource = self
        registerCells()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    private func registerCells() {
        horizontalCollectionView.register(
            CommonPeculiarityCell.self,
            forCellWithReuseIdentifier: PeculiarityCellType.common.rawValue
        )
        horizontalCollectionView.register(
            DetailsPeculiarityCell.self,
            forCellWithReuseIdentifier: PeculiarityCellType.details.rawValue
        )
    }
    
    private func setupUI() {
        addSubview(horizontalCollectionView)
        setConstraints()
    }
}

// MARK: - Collection View Data Source
extension PeculiaritiesView: UICollectionViewDataSource {
    
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
        if viewModel.relation == .toHotel ||
           indexPath.row + 1 < viewModel.getNumberOfItems() {
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

// MARK: - Collection View Compositional Layout
extension PeculiaritiesView {
    
    private func makeLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { _, _ in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .estimated(90),
                heightDimension: .absolute(29)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(39)
            )
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitems: [item]
            )
            group.contentInsets = .init(
                top: 0,
                leading: 0,
                bottom: 0,
                trailing: 0
            )
            group.interItemSpacing = .fixed(8)
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
    }
}

// MARK: - Layout
extension PeculiaritiesView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            horizontalCollectionView.topAnchor.constraint(equalTo: topAnchor),
            horizontalCollectionView.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            horizontalCollectionView.bottomAnchor.constraint(
                equalTo: bottomAnchor
            ),
            horizontalCollectionView.trailingAnchor.constraint(
                equalTo: trailingAnchor
            ),
            horizontalCollectionView.heightAnchor.constraint(
                equalToConstant: 107 // TODO: make auto
            )
        ])
    }
}
