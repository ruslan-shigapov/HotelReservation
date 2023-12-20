//
//  BookingViewController.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 20.12.2023.
//

import UIKit

private enum BookingCellType: String, CaseIterable {
    case about
}

final class BookingViewController: UIViewController {
    
    private let verticalCollectionView = VerticalCollectionView()
    
    private let viewModel = BookingViewModel()
    
    weak var coordinator: BookingScreenCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        verticalCollectionView.dataSource = self
        registerCells()
        view.addSubview(verticalCollectionView)
        verticalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
    }
    
    private func registerCells() {
        verticalCollectionView.register(
            AboutHotelCell.self,
            forCellWithReuseIdentifier: BookingCellType.about.rawValue
        )
    }
}

extension BookingViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BookingCellType.about.rawValue,
            for: indexPath
        ) as? AboutHotelCell
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - Layout
private extension BookingViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            verticalCollectionView.topAnchor.constraint(
                equalTo: view.topAnchor
            ),
            verticalCollectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            verticalCollectionView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),
            verticalCollectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            )
        ])
    }
}
