//
//  AboutHotelCellViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 20.12.2023.
//

import Foundation

final class AboutHotelCellViewModel {
    
    private let bookingData: Booking
    
    var rating: String {
        "\(bookingData.horating) \(bookingData.ratingName)"
    }

    var hotelName: String {
        bookingData.hotelName
    }
    
    var address: String {
        bookingData.hotelAdress
    }
    
    required init(bookingData: Booking) {
        self.bookingData = bookingData
    }
}
