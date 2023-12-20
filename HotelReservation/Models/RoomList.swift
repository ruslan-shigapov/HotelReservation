//
//  RoomList.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 19.12.2023.
//

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
