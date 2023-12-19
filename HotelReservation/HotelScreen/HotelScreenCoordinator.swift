//
//  HotelScreenCoordinator.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 14.12.2023.
//

import UIKit

final class HotelScreenCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let hotelVC = HotelViewController()
        hotelVC.coordinator = self
        navigationController.pushViewController(hotelVC, animated: true)
    }
    
    func runRoomsCoordinator(with title: String) {
        navigationController.title = title
        let roomsScreenCoordinator = RoomsScreenCoordinator(
            navigationController: navigationController
        )
        add(coordinator: roomsScreenCoordinator)
        roomsScreenCoordinator.start()
    }
}
