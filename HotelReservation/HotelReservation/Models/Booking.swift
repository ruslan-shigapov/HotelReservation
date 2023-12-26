//
//  Booking.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 20.12.2023.
//

struct Booking: Decodable {
    let hotelName: String
    let hotelAdress: String
    let horating: Int
    let ratingName: String
    let departure: String
    let arrivalCountry: String
    let tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room: String
    let nutrition: String
    let tourPrice: Int
    let fuelCharge: Int
    let serviceCharge: Int
}

extension Booking {
    
    static let emptyModel = Booking(
        hotelName: "",
        hotelAdress: "",
        horating: 0,
        ratingName: "",
        departure: "",
        arrivalCountry: "",
        tourDateStart: "",
        tourDateStop: "",
        numberOfNights: 0,
        room: "",
        nutrition: "",
        tourPrice: 0,
        fuelCharge: 0,
        serviceCharge: 0
    )
}
