//
//  HotelViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 14.12.2023.
//

import Foundation
import Combine

final class HotelViewModel {
    
    private var subscription: AnyCancellable? = nil
        
    @Published 
    var hotelData = Hotel.loadingModel
    
    init() {
        subscription = NetworkManager.shared.hotelDataPublisher()
            .replaceError(with: Hotel.emptyModel)
            .receive(on: DispatchQueue.main)
            .assign(to: \.hotelData, on: self)
    }
    
    func getNumberOfItems() -> Int {
        HotelCellType.allCases.count
    }
    
    func getCellType(at indexPath: IndexPath) -> HotelCellType {
        HotelCellType.allCases[indexPath.item]
    }
    
    func getMainHotelCellViewModel() -> MainHotelCellViewModel {
        MainHotelCellViewModel(hotelData: hotelData)
    }
    
    func getHotelInfoCellViewModel() -> HotelInfoCellViewModel {
        HotelInfoCellViewModel(hotelData: hotelData.aboutTheHotel)
    }
}
