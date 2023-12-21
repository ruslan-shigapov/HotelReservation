//
//  InfoButtonsView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 21.12.2023.
//

import UIKit

final class InfoButtonsView: UIView {

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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = Constants.Colors.backgroundGray
        addSubviews()
        subviews.forEach(prepareForAutoLayout)
        layer.cornerRadius = 15
        setConstraints()
    }
    
    private func addSubviews() {
        addSubview(conveniencesButton)
        addSubview(firstDividerView)
        addSubview(whatIsIncludedButton)
        addSubview(secondDividerView)
        addSubview(whatIsNotIncludedButton)
    }
    
    private func prepareForAutoLayout(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: Layout
private extension InfoButtonsView {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            conveniencesButton.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 15
            ),
            conveniencesButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 15
            ),
            conveniencesButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -15
            ),
            
            firstDividerView.topAnchor.constraint(
                equalTo: conveniencesButton.bottomAnchor,
                constant: 10
            ),
            firstDividerView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 53
            ),
            firstDividerView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -15
            ),
            
            whatIsIncludedButton.topAnchor.constraint(
                equalTo: firstDividerView.bottomAnchor,
                constant: 10
            ),
            whatIsIncludedButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 15
            ),
            whatIsIncludedButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -15
            ),
            
            secondDividerView.topAnchor.constraint(
                equalTo: whatIsIncludedButton.bottomAnchor,
                constant: 10
            ),
            secondDividerView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 53
            ),
            secondDividerView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -15
            ),
            
            whatIsNotIncludedButton.topAnchor.constraint(
                equalTo: secondDividerView.bottomAnchor,
                constant: 10
            ),
            whatIsNotIncludedButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 15
            ),
            whatIsNotIncludedButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -15
            ),
            whatIsNotIncludedButton.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -15
            )
        ])
    }
}
