//
//  RoomScreenCoordinator.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 19.12.2023.
//

import UIKit

final class RoomScreenCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let roomVC = RoomViewController()
        roomVC.title = navigationController.title
        roomVC.coordinator = self
        navigationController.pushViewController(roomVC, animated: true)
    }
}
