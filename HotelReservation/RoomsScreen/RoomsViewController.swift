//
//  RoomsViewController.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 19.12.2023.
//

import UIKit
import Combine

private enum RoomCellType: String {
    case common
}

final class RoomsViewController: UIViewController {
    
    private let verticalCollectionView = VerticalCollectionView()
    
    private let viewModel = RoomsViewModel()
    
    private var storage: Set<AnyCancellable> = []
    
    weak var coordinator: RoomsScreenCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        verticalCollectionView.dataSource = self
        registerCell()
        setupUI()
        bind()
    }
    
    private func registerCell() {
        verticalCollectionView.register(
            RoomCell.self,
            forCellWithReuseIdentifier: RoomCellType.common.rawValue
        )
    }
    
    private func setupUI() {
        view.addSubview(verticalCollectionView)
        verticalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
    }
    
    private func bind() {
        viewModel.$roomsData
            .sink { [weak self] _ in
                self?.verticalCollectionView.reloadData()
            }
            .store(in: &storage)
    }
}

// MARK: - Collection View Data Source
extension RoomsViewController: UICollectionViewDataSource {
    
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
            withReuseIdentifier: RoomCellType.common.rawValue,
            for: indexPath
        ) as? RoomCell
        cell?.viewModel = viewModel.getRoomCellViewModel(at: indexPath)
        cell?.viewModel.confirmButtonTapPublisher
            .sink { [weak self] in
                self?.coordinator?.runBooking()
            }
            .store(in: &storage)
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - Layout
private extension RoomsViewController {
    
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
