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

extension Hotel {
    
    static let defaultModel = Hotel(
        name: "Загрузка",
        adress: "Подождите",
        minimal_price: 0,
        price_for_it: "",
        rating: 0,
        rating_name: "",
        image_urls: [],
        about_the_hotel: HotelInfo(description: "", peculiarities: [])
    )
    
    static let emptyModel = Hotel(
        name: "Данные не загрузились",
        adress: "Перезапустите приложение",
        minimal_price: 0,
        price_for_it: "",
        rating: 0,
        rating_name: "",
        image_urls: [],
        about_the_hotel: HotelInfo(description: "", peculiarities: [])
    )
}
