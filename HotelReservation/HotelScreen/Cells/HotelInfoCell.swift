//
//  HotelInfoCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 17.12.2023.
//

import UIKit

final class HotelInfoCell: UICollectionViewCell {
    
    private let cellTitleLabel = CellTitleLabel()
    private let peculiaritiesView = PeculiaritiesView()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Constants.Fonts.sf16Regular
        return label
    }()
    
    private lazy var buttonTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    var viewModel: HotelInfoCellViewModel! {
        didSet {
            peculiaritiesView.viewModel = viewModel.getPeculiaritiesViewModel()
            descriptionLabel.text = viewModel.description
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        cellTitleLabel.configure(with: Constants.Text.CellTitle.aboutHotel)
        addSubviews()
        subviews.forEach(prepareForAutoLayout)
        setConstraints()
    }
    
    private func addSubviews() {
        addSubview(cellTitleLabel)
        addSubview(peculiaritiesView)
        addSubview(descriptionLabel)
        addSubview(buttonTableView)
    }
    
    private func prepareForAutoLayout(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Layout
private extension HotelInfoCell {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            cellTitleLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 16
            ),
            cellTitleLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            cellTitleLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            
            peculiaritiesView.topAnchor.constraint(
                equalTo: cellTitleLabel.bottomAnchor,
                constant: 8
            ),
            peculiaritiesView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            peculiaritiesView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            
            descriptionLabel.topAnchor.constraint(
                equalTo: peculiaritiesView.bottomAnchor,
                constant: 12
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            
            buttonTableView.heightAnchor.constraint(equalToConstant: 184),
            buttonTableView.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: 16
            ),
            buttonTableView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            buttonTableView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -16),
            buttonTableView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            )
        ])
    }
}
