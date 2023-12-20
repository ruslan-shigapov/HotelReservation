//
//  HotelInfoCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 17.12.2023.
//

import UIKit

final class HotelInfoCell: CustomCollectionViewCell {
    
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
    
    private let conveniencesButton = InfoButton(
        name: Constants.Text.conveniences,
        icon: Constants.Images.conveniences
    )
    private let whatIsIncludedButton = InfoButton(
        name: Constants.Text.whatIsIncluded,
        icon: Constants.Images.whatIsIncluded
    )
    private let whatIsNotIncludedButton = InfoButton(
        name: Constants.Text.whatIsNotIncluded,
        icon: Constants.Images.whatIsNotIncluded
    )
    
    private let firstDividerView = DividerView()
    private let secondDividerView = DividerView()
    
    private lazy var buttonsView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.backgroundGray
        view.addSubview(conveniencesButton)
        view.addSubview(whatIsIncludedButton)
        view.addSubview(whatIsNotIncludedButton)
        view.addSubview(firstDividerView)
        view.addSubview(secondDividerView)
        view.subviews.forEach(prepareForAutoLayout)
        view.layer.cornerRadius = 15
        return view
    }()
    
    weak var viewModel: HotelInfoCellViewModel! {
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
        addSubviews()
        contentView.subviews.forEach(prepareForAutoLayout)
        setConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(cellTitleLabel)
        contentView.addSubview(peculiaritiesView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(buttonsView)
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
                equalTo: contentView.topAnchor,
                constant: 16
            ),
            cellTitleLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            
            peculiaritiesView.topAnchor.constraint(
                equalTo: cellTitleLabel.bottomAnchor,
                constant: 8
            ),
            peculiaritiesView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            peculiaritiesView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -16
            ),
            
            descriptionLabel.topAnchor.constraint(
                equalTo: peculiaritiesView.bottomAnchor, 
                constant: 12
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -16
            ),
            
            buttonsView.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: 16
            ),
            buttonsView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            buttonsView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -16),
            buttonsView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -16
            ),
            
            conveniencesButton.topAnchor.constraint(
                equalTo: buttonsView.topAnchor,
                constant: 15
            ),
            conveniencesButton.leadingAnchor.constraint(
                equalTo: buttonsView.leadingAnchor,
                constant: 15
            ),
            conveniencesButton.trailingAnchor.constraint(
                equalTo: buttonsView.trailingAnchor,
                constant: -15
            ),
            
            firstDividerView.topAnchor.constraint(
                equalTo: conveniencesButton.bottomAnchor,
                constant: 10
            ),
            firstDividerView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 69
            ),
            firstDividerView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -31
            ),
            
            whatIsIncludedButton.topAnchor.constraint(
                equalTo: firstDividerView.bottomAnchor,
                constant: 10
            ),
            whatIsIncludedButton.leadingAnchor.constraint(
                equalTo: buttonsView.leadingAnchor,
                constant: 15
            ),
            whatIsIncludedButton.trailingAnchor.constraint(
                equalTo: buttonsView.trailingAnchor,
                constant: -15
            ),
            
            secondDividerView.topAnchor.constraint(
                equalTo: whatIsIncludedButton.bottomAnchor,
                constant: 10
            ),
            secondDividerView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 69
            ),
            secondDividerView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -31
            ),
            
            whatIsNotIncludedButton.topAnchor.constraint(
                equalTo: secondDividerView.bottomAnchor,
                constant: 10
            ),
            whatIsNotIncludedButton.leadingAnchor.constraint(
                equalTo: buttonsView.leadingAnchor,
                constant: 15
            ),
            whatIsNotIncludedButton.trailingAnchor.constraint(
                equalTo: buttonsView.trailingAnchor,
                constant: -15
            ),
            whatIsNotIncludedButton.bottomAnchor.constraint(
                equalTo: buttonsView.bottomAnchor,
                constant: -15
            )
        ])
    }
}
