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
            .font: Constants.Fonts.sf18Medium
        ]
        let navigationBar = navigationController.navigationBar
        navigationBar.standardAppearance = navigationBarAppearance
        navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationBar.tintColor = .label
        let navigationItem = navigationController.navigationItem
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            customView: UIImageView(image: Constants.Images.arrowBack)
        )
        // TODO: finish customization 
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
