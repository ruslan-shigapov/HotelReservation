//
//  HotelViewController.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 14.12.2023.
//

import UIKit
import Combine

private enum HotelCellType: String, CaseIterable {
    case main, info
}

final class HotelViewController: UIViewController {
    
    // MARK: Views
    private lazy var verticalCollectionView: UICollectionView = {
        let collectionView = VerticalCollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            MainHotelCell.self,
            forCellWithReuseIdentifier: HotelCellType.main.rawValue
        )
        collectionView.register(
            HotelInfoCell.self,
            forCellWithReuseIdentifier: HotelCellType.info.rawValue
        )
        return collectionView
    }()
    
    private lazy var dividerView = DividerView()
    
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
    
    // MARK: Properties
    private let viewModel = HotelViewModel()
    
    private var storage: Set<AnyCancellable> = []
    
    weak var coordinator: HotelScreenCoordinator?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
    
    // MARK: Private Methods
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
        coordinator?.runRooms(with: viewModel.hotelData.name)
    }
}

// MARK: - Collection View Data Source
extension HotelViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        HotelCellType.allCases.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cellType = HotelCellType.allCases[indexPath.item]
        var cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellType.rawValue,
            for: indexPath
        )
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

// MARK: - Collection View Delegate Flow Layout
extension HotelViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout:
        UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: 800)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 0, bottom: 12, right: 0)
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
