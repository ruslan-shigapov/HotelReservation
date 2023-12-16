//
//  HotelViewController.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 14.12.2023.
//

import UIKit

final class HotelViewController: UIViewController {
    
    private lazy var verticalCollectionView = VerticalCollectionView()
    private lazy var dividerView = DividerView()
    private lazy var confirmButton = ConfirmButton(title: "К выбору номера")
    
    weak var coordinator: HotelScreenCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupUI()
        setDelegates()
//        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.estimatedItemSize = CGSize(width: collectionView.bounds.width, height: 300)
//            layout.itemSize = UICollectionViewFlowLayout.automaticSize
//        }
        
    }
    
    private func registerCells() {
        verticalCollectionView.register(
            MainHotelDataCell.self,
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
}

private extension HotelViewController {
    
    func setConstraints() {
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
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MainHotelDataCell",
            for: indexPath
        ) as? MainHotelDataCell
        return cell ?? UICollectionViewCell()
    }
}

extension HotelViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView, 
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(
            width: view.bounds.width,
            height: 200
        )
    }
}
