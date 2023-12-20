//
//  AboutHotelCellViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 20.12.2023.
//

import Foundation

final class AboutHotelCellViewModel {
    
    private let bookingData: Booking
    
    required init(bookingData: Booking) {
        self.bookingData = bookingData
    }
}
