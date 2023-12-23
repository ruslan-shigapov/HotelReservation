//
//  HotelInfoCellViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 17.12.2023.
//

import UIKit

final class HotelInfoCellViewModel {
    
    private let hotelData: HotelInfo
    
    @Published
    var peculiarities: [String] = []
    
    var description: String {
        hotelData.description
    }

    required init(hotelData: HotelInfo) {
        self.hotelData = hotelData
        self.peculiarities = hotelData.peculiarities
    }
    
    func getNumberOfItems() -> Int {
        peculiarities.count
    }
}
