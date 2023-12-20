//
//  BookingScreenCoordinator.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 20.12.2023.
//

import UIKit

final class BookingScreenCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let bookingVC = BookingViewController()
        bookingVC.coordinator = self
        bookingVC.title = Constants.Text.booking
        bookingVC.navigationItem.backButtonTitle = .none
        navigationController.pushViewController(bookingVC, animated: true)
    }
}
