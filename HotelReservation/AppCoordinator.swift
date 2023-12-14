//
//  AppCoordinator.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 14.12.2023.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    
    private var window: UIWindow
    private var navigationController = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        let hotelScreenCoordinator = HotelScreenCoordinator(
            navigationController: navigationController
        )
        add(coordinator: hotelScreenCoordinator)
        hotelScreenCoordinator.start()
    }
}
