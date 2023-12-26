//
//  PriceCellViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 23.12.2023.
//

import Foundation
import Combine

final class PriceCellViewModel {
    
    private let bookingData: Booking
    
    let calculatedPrice = PassthroughSubject<String, Never>()
    
    var tourPrice: String {
        "\(format(price: bookingData.tourPrice)) \u{20BD}"
    }
    
    var fuelCharge: String {
        "\(format(price: bookingData.fuelCharge)) \u{20BD}"
    }
    
    var serviceCharge: String {
        "\(format(price: bookingData.serviceCharge)) \u{20BD}"
    }
    
    var totalPrice: String {
        "\(format(price: getTotalPrice())) \u{20BD}"
    }
    
    required init(bookingData: Booking) {
        self.bookingData = bookingData
    }
    
    private func format(price: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: price))!
    }
    
    private func getTotalPrice() -> Int { // TODO: make business logic
        bookingData.tourPrice + bookingData.fuelCharge + bookingData.serviceCharge
    }
    
    private func sendTotalPrice() {
        calculatedPrice.send(totalPrice)
    }
}
