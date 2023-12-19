//
//  Hotel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 14.12.2023.
//

struct Hotel: Decodable {
    let name: String
    let adress: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: HotelInfo
}

struct HotelInfo: Decodable {
    let description: String
    let peculiarities: [String]
}

extension Hotel {
    
    static let loadingModel = Hotel(
        name: "Загрузка",
        adress: "Подождите",
        minimalPrice: 0,
        priceForIt: "",
        rating: 0,
        ratingName: "",
        imageUrls: [],
        aboutTheHotel: HotelInfo(description: "", peculiarities: [])
    )
    static let emptyModel = Hotel(
        name: "Данные не загрузились",
        adress: "Перезапустите приложение",
        minimalPrice: 0,
        priceForIt: "",
        rating: 0,
        ratingName: "",
        imageUrls: [],
        aboutTheHotel: HotelInfo(description: "", peculiarities: [])
    )
}
