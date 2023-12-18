//
//  HotelViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 14.12.2023.
//

import Foundation
import Combine

enum HotelCell: String, CaseIterable {
    case main
    case info
}

final class HotelViewModel {
    
    private var subscription: AnyCancellable? = nil
    
    var mainCellIdentifier = HotelCell.main.rawValue
    var infoCellIdentifier = HotelCell.info.rawValue
        
    @Published var hotelData = Hotel.defaultModel
    
    init() {
        subscription = NetworkManager.shared.hotelDataPublisher()
            .replaceError(with: Hotel.emptyModel)
            .receive(on: DispatchQueue.main)
            .assign(to: \.hotelData, on: self)
    }
    
    func getNumberOfItems() -> Int {
        HotelCell.allCases.count
    }
    
    func getItem(at indexPath: IndexPath) -> HotelCell {
        HotelCell.allCases[indexPath.item]
    }
    
    func getMainHotelCellViewModel() -> MainHotelCellViewModel {
        MainHotelCellViewModel(hotelData: hotelData)
    }
    
    func getHotelInfoCellViewModel() -> HotelInfoCellViewModel {
        HotelInfoCellViewModel(hotelData: hotelData.about_the_hotel)
    }
}
