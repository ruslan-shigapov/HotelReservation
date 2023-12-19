//
//  RoomList.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 19.12.2023.
//

import Foundation

struct RoomList: Decodable {
    let rooms: [Room]
}

struct Room: Decodable {
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]
}

extension Room {
    
    static let loadingModel = Room(
        name: "Загрузка",
        price: 0,
        pricePer: "",
        peculiarities: [],
        imageUrls: []
    )
    
    static let emptyModel = Room(
        name: "Данные не загрузились",
        price: 0,
        pricePer: "",
        peculiarities: [],
        imageUrls: []
    )
}
