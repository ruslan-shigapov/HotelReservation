//
//  VerticalCollectionView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 16.12.2023.
//

import UIKit

final class VerticalCollectionView: UICollectionView {
    
    override init(
        frame: CGRect,
        collectionViewLayout layout: UICollectionViewLayout
    ) {
        super.init(
            frame: frame,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .secondarySystemBackground
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            layout.sectionInset = .init(top: 8, left: 0, bottom: 12, right: 0)
            layout.scrollDirection = .vertical
        }
    }
}
