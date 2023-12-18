//
//  PeculiaritiesViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 18.12.2023.
//

import Foundation

final class PeculiaritiesViewModel {
    
    @Published var peculiarities: [String] = []
    
    func getNumberOfItems() -> Int {
        peculiarities.count
    }
    
    required init(peculiarities: [String]) {
        self.peculiarities = peculiarities
    }
}
