//
//  BookingDetailsCellViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 21.12.2023.
//

import Foundation

final class BookingDetailsCellViewModel {
    
    private let bookingData: Booking
    
    var departure: String {
        bookingData.departure
    }
    
    var arrivalCountry: String {
        bookingData.arrivalCountry
    }
    
    var dates: String {
        "\(bookingData.tourDateStart)-\(bookingData.tourDateStop)"
    }
    
    var numberOfNights: String {
        "\(bookingData.numberOfNights) ночей"
    }
    
    var hotelName: String {
        bookingData.hotelName
    }
    
    var room: String {
        bookingData.room
    }
    
    var nutrition: String {
        bookingData.nutrition
    }

    required init(bookingData: Booking) {
        self.bookingData = bookingData
    }
}
