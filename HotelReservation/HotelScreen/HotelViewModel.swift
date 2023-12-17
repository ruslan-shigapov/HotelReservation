//
//  HotelViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 14.12.2023.
//

import Foundation
import Combine

protocol HotelViewModelProtocol {
    func getMainHotelCellViewModel() -> MainHotelCellViewModelProtocol
}

final class HotelViewModel: HotelViewModelProtocol {
    
    private var subscription: AnyCancellable? = nil
    
    @Published var hotelData: Hotel = Hotel.emptyModel
    
    init() {
        subscription = NetworkManager.shared.hotelDataPublisher()
            .replaceError(with: Hotel.defaultModel)
            .receive(on: DispatchQueue.main)
            .assign(to: \.hotelData, on: self)
    }
    
    func getMainHotelCellViewModel() -> MainHotelCellViewModelProtocol {
        MainHotelCellViewModel(hotelData: hotelData)
    }
}
