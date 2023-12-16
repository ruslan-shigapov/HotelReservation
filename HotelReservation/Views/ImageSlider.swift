//
//  ImageSlider.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 16.12.2023.
//

import UIKit

final class ImageSlider: UIView {
    
    private lazy var imageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.isEnabled = false
        return pageControl
    }()

    init(pages: [UIImageView]) {
        super.init(frame: .zero)
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 15
        addSubview(imageScrollView)
        setupImageScrollView(with: pages)
        imageScrollView.addSubview(pageControl)
        pageControl.numberOfPages = 5
        pageControl.currentPage = 1
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageScrollView(with pages: [UIImageView]) {
        guard pages.count > 0 else { return }
        imageScrollView.contentSize = CGSize(
            width: frame.width * CGFloat(pages.count),
            height: frame.height
        )
        for (index, page) in pages.enumerated() {
            page.frame = CGRect(
                x: frame.width * CGFloat(index),
                y: 0,
                width: frame.width,
                height: frame.height
            )
            imageScrollView.addSubview(page)
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageScrollView.topAnchor.constraint(equalTo: topAnchor),
            imageScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            pageControl.centerXAnchor.constraint(
                equalTo: imageScrollView.centerXAnchor
            ),
            pageControl.bottomAnchor.constraint(
                equalTo: imageScrollView.bottomAnchor,
                constant: -8
            )
        ])
    }
}
