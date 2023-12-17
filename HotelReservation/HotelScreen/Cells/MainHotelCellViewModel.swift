//
//  MainHotelCellViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 17.12.2023.
//

import UIKit

protocol MainHotelCellViewModelProtocol {
    var imageViews: [UIImageView] { get }
    var rating: String { get }
    var hotelName: String { get }
    var address: String { get }
    var price: String { get }
    var priceDescription: String { get }
    init(hotelData: Hotel)
}

final class MainHotelCellViewModel: MainHotelCellViewModelProtocol {
    
    private let hotelData: Hotel
    
    var imageViews: [UIImageView] {
        []
    }
    
    var rating: String {
        "\(hotelData.rating) \(hotelData.rating_name)"
    }
    
    var hotelName: String {
        hotelData.name
    }
    
    var address: String {
        hotelData.adress
    }
    
    var price: String {
        "от \(hotelData.minimal_price) \u{20BD}"
    }
    
    var priceDescription: String {
        hotelData.price_for_it.lowercased()
    }
    
    required init(hotelData: Hotel) {
        self.hotelData = hotelData
    }
}
