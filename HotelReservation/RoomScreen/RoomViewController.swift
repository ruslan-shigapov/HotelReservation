//
//  RoomViewController.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 19.12.2023.
//

import UIKit

final class RoomViewController: UIViewController {
    
    weak var coordinator: RoomScreenCoordinator?
    
    weak var viewModel: RoomViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
    }
}
