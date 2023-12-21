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
    case booking
    case customer
}

final class BookingViewController: UIViewController {
    
    // MARK: Views
    private let verticalCollectionView = VerticalCollectionView()
    private let dividerView = DividerView()

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
        verticalCollectionView.dataSource = self
        registerCells()
        setupUI()
        bind()
    }
    
    // MARK: Methods
    private func registerCells() {
        verticalCollectionView.register(
            AboutHotelCell.self,
            forCellWithReuseIdentifier: BookingCellType.about.rawValue
        )
        verticalCollectionView.register(
            BookingDetailsCell.self,
            forCellWithReuseIdentifier: BookingCellType.booking.rawValue
        )
        verticalCollectionView.register(
            CustomerInfoCell.self,
            forCellWithReuseIdentifier: BookingCellType.customer.rawValue
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
        }
        return cell
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
