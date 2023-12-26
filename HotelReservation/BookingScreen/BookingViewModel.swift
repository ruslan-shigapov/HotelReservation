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
    
    private var numbersOfItemsInSection = [3, 1, 2]
    
    let additionalTouristsCellNames = ["Второй", "Третий", "Четвертый"]
    
    @Published
    var bookingData = Booking.emptyModel
    
    @Published
    var totalPrice = ""
    
    init() {
        subscription = NetworkManager.shared.bookingDataPublisher()
            .replaceError(with: Booking.emptyModel)
            .receive(on: DispatchQueue.main)
            .assign(to: \.bookingData, on: self)
    }
    
    func getNumberOfSections() -> Int {
        numbersOfItemsInSection.count
    }
    
    func getNumberOfItemsIn(_ section: Int) -> Int {
        numbersOfItemsInSection[section]
    }
    
    func getAboutHotelCellViewModel() -> AboutHotelCellViewModel {
        AboutHotelCellViewModel(bookingData: bookingData)
    }
    
    func getBookingDetailsCellViewModel() -> BookingDetailsCellViewModel {
        BookingDetailsCellViewModel(bookingData: bookingData)
    }
    
    func addTouristCell() {
        if numbersOfItemsInSection[1] < 4 {
            numbersOfItemsInSection[1] += 1
        }
    }
    
    func getPriceCellViewModel() -> PriceCellViewModel {
        PriceCellViewModel(bookingData: bookingData)
    }
}
