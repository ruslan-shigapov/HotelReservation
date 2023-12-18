//
//  ImageSliderView.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 16.12.2023.
//

import UIKit
import Combine

final class ImageSliderView: UIView {
    
    // MARK: Views
    private lazy var imageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.layer.cornerRadius = 15
        return scrollView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .label
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    private lazy var pageControlView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 5
        view.addSubview(pageControl)
        return view
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.isEnabled = false
        pageControl.currentPageIndicatorTintColor = .label
        pageControl.pageIndicatorTintColor = Constants.Colors.customGray
        return pageControl
    }()
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageScrollView.delegate = self
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI() {
        backgroundColor = .secondarySystemBackground
        addSubviews()
        subviews.forEach(prepareForAutoLayout)
        layer.cornerRadius = 15
        setConstraints()
    }
    
    private func addSubviews() {
        addSubview(imageScrollView)
        addSubview(pageControlView)
        addSubview(activityIndicator)
    }
    
    private func prepareForAutoLayout(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
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
        
    func configure(with pages: [UIImageView]) {
        setupImageScrollView(with: pages)
        pageControl.numberOfPages = pages.count
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.activityIndicator.stopAnimating()
        }
    }
}

// MARK: - Scroll View Delegate
extension ImageSliderView: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currenPage = round(
            scrollView.contentOffset.x / scrollView.frame.size.width
        )
        pageControl.currentPage = Int(currenPage)
    }
}

// MARK: - Layout
extension ImageSliderView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageScrollView.topAnchor.constraint(equalTo: topAnchor),
            imageScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            pageControlView.centerXAnchor.constraint(
                equalTo: centerXAnchor
            ),
            pageControlView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -8
            ),
            
            pageControl.topAnchor.constraint(
                equalTo: pageControlView.topAnchor,
                constant: -2
            ),
            pageControl.leadingAnchor.constraint(
                equalTo: pageControlView.leadingAnchor,
                constant: -20
            ),
            pageControl.trailingAnchor.constraint(
                equalTo: pageControlView.trailingAnchor,
                constant: 20
            ),
            pageControl.bottomAnchor.constraint(
                equalTo: pageControlView.bottomAnchor,
                constant: 2
            ),
        ])
    }
}
