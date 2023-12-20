//
//  RoomCellViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 19.12.2023.
//

import UIKit
import Combine

final class RoomCellViewModel {
    
    private let roomData: Room
    
    private var subscription: AnyCancellable? = nil
    
    @Published
    var imageViews: [UIImageView] = []
    
    var roomName: String {
        roomData.name
    }
    
    var price: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let formattedPrice = formatter.string(
            from: NSNumber(value: roomData.price)
        )!
        return "\(formattedPrice) \u{20BD}"
    }
    
    var priceDescription: String {
        roomData.pricePer.lowercased()
    }
    
    required init(roomData: Room) {
        self.roomData = roomData
//        subscription = NetworkManager.shared.imageViewsPublisher(
//            by: roomData.imageUrls
//        )
//        .replaceError(with: [])
//        .assign(to: \.imageViews, on: self)
    }
    
    func getPeculiaritiesViewModel() -> PeculiaritiesViewModel {
        PeculiaritiesViewModel(
            peculiarities: roomData.peculiarities,
            relation: .toRoom
        )
    }
}
