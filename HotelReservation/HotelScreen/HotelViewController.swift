//
//  HotelViewController.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 14.12.2023.
//

import UIKit
import Combine

enum HotelCellType: String, CaseIterable {
    case main
    case info
}

final class HotelViewController: UIViewController {
    
    private let verticalCollectionView = VerticalCollectionView()
    private let dividerView = DividerView()
    
    private lazy var confirmButton: UIButton = {
        let button = ConfirmButton(
            title: Constants.Text.ButtonTitle.toRoomChoice
        )
        button.addTarget(
            self,
            action: #selector(confirmButtonWasPressed),
            for: .touchUpInside
        )
        return button
    }()
    
    private let viewModel = HotelViewModel()
    
    private var storage: Set<AnyCancellable> = []
    
    weak var coordinator: HotelScreenCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        verticalCollectionView.dataSource = self
        registerCells()
        setupUI()
        bind()
    }
    
    private func registerCells() {
        verticalCollectionView.register(
            MainHotelCell.self,
            forCellWithReuseIdentifier: HotelCellType.main.rawValue
        )
        verticalCollectionView.register(
            HotelInfoCell.self,
            forCellWithReuseIdentifier: HotelCellType.info.rawValue
        )
    }
    
    private func setupUI() {
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
    
    @objc private func confirmButtonWasPressed() {
        coordinator?.runRoomsCoordinator(with: viewModel.hotelData.name)
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
        let cellType = viewModel.getCellType(at: indexPath)
        var cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellType.rawValue,
            for: indexPath
        )
        cell.contentView.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width
        ).isActive = true
        switch cellType {
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
            confirmButton.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: -28
            ),
            confirmButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16
            )
        ])
    }
}
