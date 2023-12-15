//
//  AppCoordinator.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 14.12.2023.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    
    private var window: UIWindow
    private var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .systemBackground
        navigationBarAppearance.shadowColor = .clear
        navigationBarAppearance.titleTextAttributes = [
            .font: Constants.Fonts.navigationBar
        ]
        
        let navigationBar = navigationController.navigationBar
        navigationBar.standardAppearance = navigationBarAppearance
        navigationBar.scrollEdgeAppearance = navigationBarAppearance
        
        return navigationController
    }()
    
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
