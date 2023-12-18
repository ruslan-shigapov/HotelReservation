//
//  HotelViewController.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 14.12.2023.
//

import UIKit
import Combine

enum HotelCell: String, CaseIterable {
    case main
    case info
}

final class HotelViewController: UIViewController {
    
    private let verticalCollectionView = VerticalCollectionView()
    private let dividerView = DividerView()
    private let confirmButton = ConfirmButton(
        title: Constants.Text.ButtonTitle.toRoomChoice
    )
    
    private let viewModel = HotelViewModel()
    
    private var storage: Set<AnyCancellable> = []
    
    weak var coordinator: HotelScreenCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setDelegates()
        setupUI()
        bind()
    }
    
    private func registerCells() {
        verticalCollectionView.register(
            MainHotelCell.self,
            forCellWithReuseIdentifier: HotelCell.main.rawValue
        )
        verticalCollectionView.register(
            HotelInfoCell.self,
            forCellWithReuseIdentifier: HotelCell.info.rawValue
        )
    }
    
    private func setDelegates() {
        verticalCollectionView.dataSource = self
        verticalCollectionView.delegate = self
    }
    
    private func setupUI() {
        title = Constants.Text.mainTitle
        view.backgroundColor = .systemBackground
        addSubviews()
        view.subviews.forEach(prepareForAutoLayout)
        setConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(verticalCollectionView)
        view.addSubview(dividerView)
        view.addSubview(confirmButton)
    }
    
    private func prepareForAutoLayout(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func bind() {
        viewModel.$hotelData
            .sink { [weak self] _ in
                self?.verticalCollectionView.reloadData()
            }
            .store(in: &storage)
    }
}

// MARK: - Collection View Data Source
extension HotelViewController: UICollectionViewDataSource {
    
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
        let item = viewModel.getItem(at: indexPath)
        var cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: item.rawValue,
            for: indexPath
        )
        // TODO: create parent cell
        cell.backgroundColor = .systemBackground
        cell.layer.cornerRadius = 12
        switch item {
        case .main:
            let mainCell = cell as? MainHotelCell
            mainCell?.viewModel = viewModel.getMainHotelCellViewModel()
            cell = mainCell ?? UICollectionViewCell()
        case .info:
            let infoCell = cell as? HotelInfoCell
            infoCell?.viewModel = viewModel.getHotelInfoCellViewModel()
            cell = infoCell ?? UICollectionViewCell()
        }
        return cell
    }
}

// MARK: - Layout
extension HotelViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            verticalCollectionView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: -18
            ),
            verticalCollectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            verticalCollectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            dividerView.topAnchor.constraint(
                equalTo: verticalCollectionView.bottomAnchor
            ),
            dividerView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            dividerView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            confirmButton.topAnchor.constraint(
                equalTo: dividerView.bottomAnchor,
                constant: 12
            ),
            confirmButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 16
            ),
            confirmButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16
            ),
            confirmButton.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: -28
            )
        ])
    }
}


// MARK: - Temporary 
extension HotelViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView, 
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(
            width: view.bounds.width,
            height: 480
        )
    }
}
