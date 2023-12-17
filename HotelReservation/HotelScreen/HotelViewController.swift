//
//  HotelViewController.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 14.12.2023.
//

import UIKit
import Combine

final class HotelViewController: UIViewController {
    
    private let verticalCollectionView = VerticalCollectionView()
    private let dividerView = DividerView()
    private let confirmButton = ConfirmButton(title: "К выбору номера")
    
    private let viewModel = HotelViewModel()
    private var storage: Set<AnyCancellable> = []
    weak var coordinator: HotelScreenCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel = HotelViewModel()

        registerCells()
        
        setDelegates()
        setupUI()
        binding()
//        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.estimatedItemSize = CGSize(width: collectionView.bounds.width, height: 300)
//            layout.itemSize = UICollectionViewFlowLayout.automaticSize
//        }
        
    }
    
    private func registerCells() {
        verticalCollectionView.register(
            MainHotelCell.self,
            forCellWithReuseIdentifier: "MainHotelDataCell"
        )
    }
    
    private func setupUI() {
        title = "Отель"
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
    
    private func setDelegates() {
        verticalCollectionView.dataSource = self
        verticalCollectionView.delegate = self
    }
    
    private func binding() {
        viewModel.$hotelData
//            .receive(on: DispatchQueue.main)
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
        1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MainHotelDataCell",
            for: indexPath
        ) as? MainHotelCell else {
            return UICollectionViewCell()
        }
        cell.viewModel = viewModel.getMainHotelCellViewModel()
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
            height: 430
        )
    }
}
