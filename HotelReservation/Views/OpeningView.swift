//
//  OpeningView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 23.12.2023.
//

import UIKit

final class OpeningView: UIView {

    private lazy var firstNameTextFieldView = RoundedTextFieldView(
        placeholder: Constants.Text.Placeholder.firstName,
        type: .text
    )
    private lazy var lastNameTextFieldView = RoundedTextFieldView(
        placeholder: Constants.Text.Placeholder.lastName,
        type: .text
    )
    private lazy var birthDateTextFieldView = RoundedTextFieldView(
        placeholder: Constants.Text.Placeholder.birthDate,
        type: .date
    )
    private lazy var citizenshipTextFieldView = RoundedTextFieldView(
        placeholder: Constants.Text.Placeholder.citizenship,
        type: .text
    )
    private lazy var passportNumberTextFieldView = RoundedTextFieldView(
        placeholder: Constants.Text.Placeholder.passportNumber,
        type: .decimal
    )
    private lazy var passportPeriodTextFieldView = RoundedTextFieldView(
        placeholder: Constants.Text.Placeholder.passportPeriod,
        type: .date
    )
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            firstNameTextFieldView,
            lastNameTextFieldView,
            birthDateTextFieldView,
            citizenshipTextFieldView,
            passportNumberTextFieldView,
            passportPeriodTextFieldView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
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
private extension OpeningView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor
            )
        ])
    }
}
