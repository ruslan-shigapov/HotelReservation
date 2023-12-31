//
//  RoomsScreenCoordinator.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 19.12.2023.
//

import UIKit

final class RoomsScreenCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let roomsVC = RoomsViewController()
        roomsVC.coordinator = self
        roomsVC.title = navigationController.title
        navigationController.pushViewController(roomsVC, animated: true)
    }
    
    func runBooking() {
        let bookingScreenCoordinator = BookingScreenCoordinator(
            navigationController: navigationController
        )
        add(coordinator: bookingScreenCoordinator)
        bookingScreenCoordinator.start()
    }
}
