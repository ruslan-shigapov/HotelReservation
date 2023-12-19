//
//  HotelInfoCellViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 17.12.2023.
//

import UIKit

final class HotelInfoCellViewModel {
    
    private let hotelData: HotelInfo
    
    var peculiarities: [String] {
        hotelData.peculiarities
    }
    
    var description: String {
        hotelData.description
    }

    required init(hotelData: HotelInfo) {
        self.hotelData = hotelData
    }
    
    func getPeculiaritiesViewModel() -> PeculiaritiesViewModel {
        PeculiaritiesViewModel(
            peculiarities: hotelData.peculiarities,
            relation: .toHotel
        )
    }
}
