//
//  BookingViewController.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 20.12.2023.
//

import UIKit
import Combine

private enum BookingCellType: String, CaseIterable {
    case about, booking, customer, tourist, additional, addTourist, price
}

final class BookingViewController: UIViewController {
    
    // MARK: Views
    private lazy var verticalCollectionView: UICollectionView = {
        let collectionView = VerticalCollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            AboutHotelCell.self,
            forCellWithReuseIdentifier: BookingCellType.about.rawValue
        )
        collectionView.register(
            BookingDetailsCell.self,
            forCellWithReuseIdentifier: BookingCellType.booking.rawValue
        )
        collectionView.register(
            CustomerInfoCell.self,
            forCellWithReuseIdentifier: BookingCellType.customer.rawValue
        )
        collectionView.register(
            FirstTouristCell.self,
            forCellWithReuseIdentifier: BookingCellType.tourist.rawValue
        )
        collectionView.register(
            AdditionalTouristCell.self,
            forCellWithReuseIdentifier: BookingCellType.additional.rawValue
        )
        collectionView.register(
            AddTouristCell.self,
            forCellWithReuseIdentifier: BookingCellType.addTourist.rawValue
        )
        collectionView.register(
            PriceCell.self,
            forCellWithReuseIdentifier: BookingCellType.price.rawValue
        )
        return collectionView
    }()
    
    private lazy var dividerView = DividerView()

    private lazy var confirmButton: UIButton = {
        let button = ConfirmButton(
            title: "Оплатить 198 036 \u{20BD}" // TEMPORARY
        )
        button.addTarget(
            self,
            action: #selector(confirmButtonWasPressed),
            for: .touchUpInside
        )
        return button
    }()
    
    // MARK: Properties
    private let viewModel = BookingViewModel()
    
    private var storage: Set<AnyCancellable> = []
    
    weak var coordinator: BookingScreenCoordinator?
    
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
        viewModel.$bookingData
            .sink { [weak self] _ in
                self?.verticalCollectionView.reloadData()
            }
            .store(in: &storage)
    }
    
    @objc private func confirmButtonWasPressed() {
        
    }
}

// MARK: - Collection View Data Source
extension BookingViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.getNumberOfSections()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        viewModel.getNumberOfItemsIn(section)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        var cell: VerticalCollectionViewCell?
        switch (indexPath.section, indexPath.item) {
        case(0, 0):
            let aboutCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BookingCellType.about.rawValue,
                for: indexPath
            ) as? AboutHotelCell
            aboutCell?.viewModel = viewModel.getAboutHotelCellViewModel()
            cell = aboutCell
        case(0, 1):
            let detailsCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BookingCellType.booking.rawValue,
                for: indexPath
            ) as? BookingDetailsCell
            detailsCell?.viewModel = viewModel.getBookingDetailsCellViewModel()
            cell = detailsCell
        case(0, 2):
            cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BookingCellType.customer.rawValue,
                for: indexPath
            ) as? CustomerInfoCell
        case(1, 0):
            cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BookingCellType.tourist.rawValue,
                for: indexPath
            ) as? FirstTouristCell
        case(2, 0):
            let addTouristCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BookingCellType.addTourist.rawValue,
                for: indexPath
            ) as? AddTouristCell
            addTouristCell?.addButtonTapPublisher
                .sink { [weak self] in
                    self?.viewModel.addTouristCell()
//                    self?.verticalCollectionView.reloadData()
                }
                .store(in: &storage)
            cell = addTouristCell
        case(2, 1):
            let priceCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BookingCellType.price.rawValue,
                for: indexPath
            ) as? PriceCell
            priceCell?.viewModel = viewModel.getPriceCellViewModel()
            cell = priceCell
        default: 
            let additionalCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BookingCellType.additional.rawValue,
                for: indexPath
            ) as? AdditionalTouristCell
            additionalCell?.configure(
                with: viewModel.additionalTouristsCellNames[indexPath.item - 1]
            )
            cell = additionalCell
        }
// TODO: закончить логику
//            priceCell?.viewModel.calculatedPrice
//                .assign(to: \.totalPrice, on: viewModel)
//                .store(in: &storage)
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - Collection View Delegate Flow Layout
extension BookingViewController: UICollectionViewDelegateFlowLayout {
    
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
        let lastSectionIndex = collectionView.numberOfSections - 1
        let bottomInset: CGFloat = section == lastSectionIndex ? 10 : 0
        return UIEdgeInsets(top: 8, left: 0, bottom: bottomInset, right: 0)
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
