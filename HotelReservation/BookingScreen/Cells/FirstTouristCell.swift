//
//  FirstTouristCell.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 23.12.2023.
//

import UIKit

final class FirstTouristCell: VerticalCollectionViewCell {
        
    // MARK: Views
    private lazy var cellTitleLabel: UILabel = {
        let label = CellTitleLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.configure(with: Constants.Text.CellTitle.firstTourist)
        return label
    }()
    
    private lazy var openButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Constants.Colors.backgroundBlue
        button.layer.cornerRadius = 6
        button.addTarget(
            self,
            action: #selector(openButtonWasPressed),
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.addSubview(cellTitleLabel)
        view.addSubview(openButton)
        return view
    }()
    
    private lazy var openingView = OpeningView()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [mainView, openingView]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 17
        return stackView
    }()
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private Methods 
    private func setupUI() {
        addSubview(containerStackView)
        setConstraints()
    }
    
    @objc private func openButtonWasPressed() {
        
    }
}

// MARK: - Layout
private extension FirstTouristCell {
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
            ),
            
            cellTitleLabel.centerYAnchor.constraint(
                equalTo: mainView.centerYAnchor
            ),
            cellTitleLabel.leadingAnchor.constraint(
                equalTo: mainView.leadingAnchor
            ),
            
            openButton.heightAnchor.constraint(
                equalTo: cellTitleLabel.heightAnchor,
                constant: 6
            ),
            openButton.widthAnchor.constraint(equalTo: openButton.heightAnchor),
            openButton.topAnchor.constraint(equalTo: mainView.topAnchor),
            openButton.trailingAnchor.constraint(
                equalTo: mainView.trailingAnchor
            ),
            openButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
        ])
    }
}
