//
//  Hotel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 14.12.2023.
//

struct Hotel: Decodable {
    let name: String
    let adress: String
    let minimal_price: Int
    let price_for_it: String
    let rating: Int
    let rating_name: String
    let image_urls: [String]
    let about_the_hotel: HotelInfo
}

struct HotelInfo: Decodable {
    let description: String
    let peculiarities: [String]
}
