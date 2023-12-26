//
//  PeculiaritiesCollectionView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 18.12.2023.
//

import UIKit

final class PeculiaritiesCollectionView: UICollectionView {
    
    override init(
        frame: CGRect,
        collectionViewLayout layout: UICollectionViewLayout
    ) {
        super.init(
            frame: frame,
            collectionViewLayout: UICollectionViewLayout()
        )
        
        collectionViewLayout = makeLayout()
        isScrollEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
