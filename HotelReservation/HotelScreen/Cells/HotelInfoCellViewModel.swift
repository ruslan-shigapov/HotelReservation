//
//  HotelInfoCellViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 17.12.2023.
//

import Foundation

final class HotelInfoCellViewModel {
    
    private let hotelData: HotelInfo
    
    required init(hotelData: HotelInfo) {
        self.hotelData = hotelData
    }
}
