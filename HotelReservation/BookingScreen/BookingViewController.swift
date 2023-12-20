//
//  BookingViewController.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 20.12.2023.
//

import UIKit
import Combine

enum BookingCellType: String, CaseIterable {
    case about
}

final class BookingViewController: UIViewController {
    
    private let verticalCollectionView = VerticalCollectionView()
    
    private let viewModel = BookingViewModel()
    
    private var storage: Set<AnyCancellable> = []
    
    weak var coordinator: BookingScreenCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        verticalCollectionView.dataSource = self
        registerCells()
        view.addSubview(verticalCollectionView)
        
        verticalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
        bind()
    }
    
    private func registerCells() {
        verticalCollectionView.register(
            AboutHotelCell.self,
            forCellWithReuseIdentifier: BookingCellType.about.rawValue
        )
    }
    
    private func bind() {
        viewModel.$bookingData
            .sink { [weak self] _ in
                self?.verticalCollectionView.reloadData()
            }
            .store(in: &storage)
    }
}

// MARK: - Collection View Data Source
extension BookingViewController: UICollectionViewDataSource {
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
            withReuseIdentifier: BookingCellType.about.rawValue,
            for: indexPath
        ) as? AboutHotelCell
        cell?.contentView.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width
        ).isActive = true
        cell?.viewModel = viewModel.getRoomCellViewModel()
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
