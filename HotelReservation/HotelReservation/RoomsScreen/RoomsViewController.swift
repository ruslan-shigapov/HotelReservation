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
    
    // MARK: Views
    private lazy var verticalCollectionView: UICollectionView = {
        let collectionView = VerticalCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            RoomCell.self,
            forCellWithReuseIdentifier: RoomCellType.common.rawValue
        )
        return collectionView
    }()
    
    // MARK: Properties
    private let viewModel = RoomsViewModel()
    
    private var storage: Set<AnyCancellable> = []
    
    weak var coordinator: RoomsScreenCoordinator?
    
    // MARK: Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
    
    // MARK: Private Methods 
    private func setupUI() {
        view.addSubview(verticalCollectionView)
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
        // TODO: make auto
        cell?.peculiaritiesCollectionView.heightAnchor.constraint(
            equalToConstant: indexPath.item == 1 ? 107 : 68
        ).isActive = true
        cell?.viewModel = viewModel.getRoomCellViewModel(at: indexPath)
        cell?.viewModel.confirmButtonTapPublisher
            .sink { [weak self] in
                self?.coordinator?.runBooking()
            }
            .store(in: &storage)
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - Collection View Delegate Flow Layout
extension RoomsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout:
        UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: 800)
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
