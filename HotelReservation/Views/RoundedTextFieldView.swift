//
//  RoundedTextFieldView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 21.12.2023.
//

import UIKit

enum TextFieldType {
    case phoneNumber
    case email
    case text
    case date
    case decimal
}

final class RoundedTextFieldView: UIView {
    
    private lazy var roundedTextField: UITextField = {
        let textField = UITextField()
        textField.font = Constants.Fonts.sf16Regular
        textField.addTarget(
            self,
            action: #selector(addFloatingLabel),
            for: .editingDidBegin
        )
        textField.addTarget(
            self,
            action: #selector(removeFloatingLabel),
            for: .editingDidEnd
        )
        return textField
    }()
    
    private lazy var floatingLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.placeholderGray
        label.font = Constants.Fonts.sf12Regular
        label.isHidden = true
        return label
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [floatingLabel, roundedTextField]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private let textFieldType: TextFieldType
    private let _placeholder: String
    
    init(placeholder: String, type: TextFieldType) {
        self.textFieldType = type
        self._placeholder = placeholder
        super.init(frame: .zero)
        
        roundedTextField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [ .font: Constants.Fonts.sf17Regular ]
        )
        setupUI()
        setStandardConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = Constants.Colors.textFieldGray
        addSubview(contentStackView)
        layer.cornerRadius = 10
        setStandardConstraints()
    }
    
    @objc private func addFloatingLabel() {
        if roundedTextField.text == "" {
            floatingLabel.text = _placeholder
            floatingLabel.isHidden = false
            switch textFieldType {
            case .phoneNumber:
                roundedTextField.placeholder = "+7 (***) ***-**-**"
            case .email, .text, .decimal:
                roundedTextField.placeholder = ""
            case .date: 
                roundedTextField.placeholder = "__.__.__"
            }
        }
    }
    
    @objc private func removeFloatingLabel() {
        if roundedTextField.text == "" {
            floatingLabel.isHidden = true
            roundedTextField.placeholder = _placeholder
        }
    }
}

// MARK: Layout
private extension RoundedTextFieldView {
    
    func setStandardConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 52),
            
            contentStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contentStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            contentStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            )
        ])
    }
}
