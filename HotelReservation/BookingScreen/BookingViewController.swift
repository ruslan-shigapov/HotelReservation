//
//  BookingViewController.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 20.12.2023.
//

import UIKit
import Combine

private enum BookingCellType: String, CaseIterable {
    case about
    case booking
    case customer
    case tourist
    case addTourist
    case price
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
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        BookingCellType.allCases.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cellType = BookingCellType.allCases[indexPath.item]
        var cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellType.rawValue,
            for: indexPath
        )
        switch cellType {
        case .about:
            let aboutCell = cell as? AboutHotelCell
            aboutCell?.viewModel = viewModel.getAboutHotelCellViewModel()
            cell = aboutCell ?? UICollectionViewCell()
        case .booking:
            let detailsCell = cell as? BookingDetailsCell
            detailsCell?.viewModel = viewModel.getBookingDetailsCellViewModel()
            cell = detailsCell ?? UICollectionViewCell()
        case .customer:
            cell = cell as? CustomerInfoCell ?? UICollectionViewCell()
        case .tourist:
            cell = cell as? FirstTouristCell ?? UICollectionViewCell()
        case .addTourist:
            cell = cell as? AddTouristCell ?? UICollectionViewCell()
        case .price:
            let priceCell = cell as? PriceCell
            priceCell?.viewModel = viewModel.getPriceCellViewModel()
//            priceCell?.viewModel.calculatedPrice
//                .assign(to: \.totalPrice, on: viewModel)
//                .store(in: &storage)
            cell = priceCell ?? UICollectionViewCell()
        }
        return cell
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
