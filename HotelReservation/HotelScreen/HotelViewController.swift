//
//  HotelViewController.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 14.12.2023.
//

import UIKit

final class HotelViewController: UIViewController {
    
    weak var coordinator: HotelScreenCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
}
