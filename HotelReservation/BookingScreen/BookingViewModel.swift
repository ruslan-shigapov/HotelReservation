//
//  BookingViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 20.12.2023.
//

import Foundation
import Combine

final class BookingViewModel {
    
    private var subscription: AnyCancellable? = nil
    
    @Published
    var bookingData = Booking.emptyModel
    
    init() {
        subscription = NetworkManager.shared.bookingDataPublisher()
            .replaceError(with: Booking.emptyModel)
            .receive(on: DispatchQueue.main)
            .assign(to: \.bookingData, on: self)
    }
    
    func getAboutHotelCellViewModel() -> AboutHotelCellViewModel {
        AboutHotelCellViewModel(bookingData: bookingData)
    }
    
    func getBookingDetailsCellViewModel() -> BookingDetailsCellViewModel {
        BookingDetailsCellViewModel(bookingData: bookingData)
    }
}
