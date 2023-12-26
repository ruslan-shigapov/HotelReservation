//
//  CustomerInfoCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 21.12.2023.
//

import UIKit

final class CustomerInfoCell: VerticalCollectionViewCell {
    
    private lazy var cellTitleLabel: UILabel = {
        let label = CellTitleLabel()
        label.configure(with: Constants.Text.CellTitle.customerInfo)
        return label
    }()
    
    private lazy var phoneNumberTextFieldView = RoundedTextFieldView(
        placeholder: Constants.Text.Placeholder.phoneNumber,
        type: .phoneNumber
    )
    private lazy var emailTextFieldView = RoundedTextFieldView(
        placeholder: Constants.Text.Placeholder.email,
        type: .email
    )
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.sf14Regular
        label.textColor = Constants.Colors.customGray
        label.text = Constants.Text.aboutSafety
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var containerStackView: UIStackView = {
        let innerStackView = UIStackView(arrangedSubviews: [
            phoneNumberTextFieldView,
            emailTextFieldView,
            descriptionLabel
        ])
        innerStackView.axis = .vertical
        innerStackView.spacing = 8
        
        let stackView = UIStackView(
            arrangedSubviews: [cellTitleLabel, innerStackView]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(containerStackView)
        setConstraints()
    }
}

// MARK: - Layout
private extension CustomerInfoCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 16
            ),
            containerStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            containerStackView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -16
            ),
            containerStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            )
        ])
    }
}
