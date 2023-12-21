//
//  HotelInfoCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 17.12.2023.
//

import UIKit

final class HotelInfoCell: VerticalCollectionViewCell {
    
    // MARK: Views
    private lazy var cellTitleLabel: UILabel = {
        let label = CellTitleLabel()
        label.configure(with: Constants.Text.CellTitle.aboutHotel)
        return label
    }()
    
    private let peculiaritiesView = PeculiaritiesView()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Constants.Fonts.sf16Regular
        return label
    }()
        
    private let infoButtonsView = InfoButtonsView()
    
    private lazy var contentStackView: UIStackView = {
        let innerStackView = UIStackView(
            arrangedSubviews: [peculiaritiesView, descriptionLabel]
        )
        innerStackView.axis = .vertical
        innerStackView.spacing = 12
        
        let stackView = UIStackView(
            arrangedSubviews: [cellTitleLabel, innerStackView, infoButtonsView]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    // MARK: Binding
    weak var viewModel: HotelInfoCellViewModel! {
        didSet {
            peculiaritiesView.viewModel = viewModel.getPeculiaritiesViewModel()
            descriptionLabel.text = viewModel.description
        }
    }
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup
    private func setupUI() {
        addSubview(contentStackView)
        setConstraints()
    }
}

// MARK: - Layout
private extension HotelInfoCell {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 16
            ),
            contentStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            contentStackView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -16
            ),
            contentStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            )
        ])
    }
}
