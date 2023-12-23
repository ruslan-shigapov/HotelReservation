//
//  InfoButton.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 18.12.2023.
//

import UIKit

final class InfoButton: UIButton {
    
    private let iconImageView = UIImageView()
    private let arrowImageView = UIImageView(image: Constants.Images.arrowNext)
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.sf16Medium
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let label = UILabel()
        label.text = Constants.Text.mostNecessary
        label.textColor = Constants.Colors.customGray
        label.font = Constants.Fonts.sf14Medium
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, label])
        stackView.axis = .vertical
        return stackView
    }()

    init(name: String, icon: UIImage) {
        super.init(frame: .zero)
        
        nameLabel.text = name
        iconImageView.image = icon
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubviews()
        subviews.forEach(prepareForAutoLayout)
        setConstraints()
    }
    
    private func addSubviews() {
        addSubview(iconImageView)
        addSubview(labelsStackView)
        addSubview(arrowImageView)
    }
    
    private func prepareForAutoLayout(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(
                equalTo: iconImageView.trailingAnchor,
                constant: 12
            ),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
