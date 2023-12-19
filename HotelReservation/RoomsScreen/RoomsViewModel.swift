//
//  RoomsViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 19.12.2023.
//

import Foundation
import Combine

final class RoomsViewModel {
    
    private var subscription: AnyCancellable? = nil
    
    @Published
    var roomsData: [Room] = []
    
    init() {
        subscription = NetworkManager.shared.roomsDataPublisher()
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: \.roomsData, on: self)
    }
    
    func getNumberOfItems() -> Int {
        roomsData.count
    }
    
    func getRoomCellViewModel(at indexPath: IndexPath) -> RoomCellViewModel {
        RoomCellViewModel(roomData: roomsData[indexPath.item])
    }
}
