//
//  RoundedTextFieldView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 21.12.2023.
//

import UIKit

final class RoundedTextFieldView: UIView {
    
    private lazy var roundedTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = Constants.Colors.textFieldGray
        addSubview(roundedTextField)
        layer.cornerRadius = 10
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 52),
            
            roundedTextField.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 10
            ),
            roundedTextField.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            roundedTextField.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -10
            ),
            roundedTextField.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
        ])
    }
    
    func configure(with title: String) {
        
    }
}
