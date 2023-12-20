//
//  BookingViewController.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 20.12.2023.
//

import UIKit

final class BookingViewController: UIViewController {
    
    private let verticalCollectionView = VerticalCollectionView()
    
    weak var coordinator: BookingScreenCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
    }
}
