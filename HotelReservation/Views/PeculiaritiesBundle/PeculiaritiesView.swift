//
//  PeculiaritiesView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 18.12.2023.
//

import UIKit
import Combine

private enum PeculiarityCell: String, CaseIterable {
    case common
    case details
}

final class PeculiaritiesView: UIView {

    private lazy var horizontalCollectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: makeLayout()
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        registerCells()
        horizontalCollectionView.dataSource = self
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func registerCells() {
        horizontalCollectionView.register(
            CommonPeculiarityCell.self,
            forCellWithReuseIdentifier: PeculiarityCell.common.rawValue
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
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PeculiarityCell.common.rawValue,
            for: indexPath
        ) as? CommonPeculiarityCell
        cell?.configure(with: viewModel.peculiarities[indexPath.item])
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - Collection View Compositional Layout
extension PeculiaritiesView {
    
    private func makeLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { _, _ in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .estimated(90),
                heightDimension: .fractionalHeight(1.0)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(40)
            )
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitems: [item]
            )
            group.contentInsets = .init(
                top: 8,
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
            )
        ])
    }
}
