//
//  MainHotelCellViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 17.12.2023.
//

import UIKit
import Combine

final class MainHotelCellViewModel {
    
    private let hotelData: Hotel
    
    private var subscription: AnyCancellable? = nil
    
    @Published 
    var imageViews: [UIImageView] = []
    
    var rating: String {
        "\(hotelData.rating) \(hotelData.ratingName)"
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
            from: NSNumber(value: hotelData.minimalPrice)
        )!
        return "от \(formattedPrice) \u{20BD}"
    }
    
    var priceDescription: String {
        hotelData.priceForIt.lowercased() 
    }
    
    required init(hotelData: Hotel) {
        self.hotelData = hotelData
        subscription = NetworkManager.shared.imageViewsPublisher(
            by: hotelData.imageUrls
        )
        .replaceError(with: [])
        .assign(to: \.imageViews, on: self)
    }
}
