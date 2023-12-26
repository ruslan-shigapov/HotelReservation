//
//  AddTouristCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 24.12.2023.
//

import UIKit
import Combine

final class AddTouristCell: VerticalCollectionViewCell {
    
    let addButtonTapPublisher = PassthroughSubject<Void, Never>()
    
    private lazy var cellTitleLabel: UILabel = {
        let label = CellTitleLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.configure(with: Constants.Text.CellTitle.addTourist)
        return label
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Constants.Colors.customBlue
        button.setImage(Constants.Images.whitePlus, for: .normal)
        button.layer.cornerRadius = 6
        button.addTarget(
            self,
            action: #selector(addButtonWasPressed),
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cellTitleLabel)
        view.addSubview(addButton)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(containerView)
        setConstraints()
    }
    
    @objc private func addButtonWasPressed() {
        addButtonTapPublisher.send()
    }
}

// MARK: - Layout
private extension AddTouristCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 16
            ),
            containerView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            containerView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -16
            ),
            containerView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            
            cellTitleLabel.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor
            ),
            cellTitleLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor
            ),
            
            addButton.heightAnchor.constraint(
                equalTo: cellTitleLabel.heightAnchor,
                constant: 6
            ),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor),
            addButton.topAnchor.constraint(equalTo: containerView.topAnchor),
            addButton.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor
            ),
            addButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
