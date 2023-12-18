//
//  MainHotelCellViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 17.12.2023.
//

import UIKit
import Combine

final class MainHotelCellViewModel {
    
    private var subscription: AnyCancellable? = nil
    
    private let hotelData: Hotel
    
    @Published var imageViews: [UIImageView] = []
    
    var rating: String {
        "\(hotelData.rating) \(hotelData.rating_name)"
    }
    
    var hotelName: String {
        hotelData.name
    }
    
    var address: String {
        hotelData.adress
    }
    
    var minimalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let formattedPrice = formatter.string(
            from: NSNumber(value: hotelData.minimal_price)
        )!
        return "от \(formattedPrice) \u{20BD}"
    }
    
    var priceDescription: String {
        hotelData.price_for_it.lowercased() 
    }
    
    required init(hotelData: Hotel) {
        self.hotelData = hotelData
        
        subscription = NetworkManager.shared.imageViewsPublisher(
            by: hotelData.image_urls
        )
        .replaceError(with: [])
        .assign(to: \.imageViews, on: self)
    }
}
