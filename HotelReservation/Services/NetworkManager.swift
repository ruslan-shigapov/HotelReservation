//
//  NetworkManager.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 16.12.2023.
//

import UIKit
import Combine

private enum Link: String {
    case hotel = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
    case rooms = "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195"
    case booking = "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff"
}

enum NetworkError: Error {
    case sessionError(Error)
    case noData
    case decodingError
    case imagesNotLoaded
}

final class NetworkManager {
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func hotelDataPublisher() -> AnyPublisher<Hotel, NetworkError> {
        URLSession.shared.dataTaskPublisher(
            for: URL(string: Link.hotel.rawValue)!
        )
        .mapError { NetworkError.sessionError($0) }
        .tryMap {
            guard !$0.data.isEmpty else { throw NetworkError.noData }
            return $0.data
        }
        .decode(type: Hotel.self, decoder: decoder)
        .map { $0 }
        .mapError { _ in NetworkError.decodingError }
        .eraseToAnyPublisher()
    }
    
    func imageViewsPublisher(
        by urls: [String]
    ) -> AnyPublisher<[UIImageView], NetworkError> {
        urls.publisher
            .flatMap {
                URLSession.shared.dataTaskPublisher(for: URL(string: $0)!)
                    .compactMap { UIImage(data: $0.data) }
            }
            .mapError { _ in NetworkError.imagesNotLoaded }
            .receive(on: DispatchQueue.main)
            .map { UIImageView(image: $0) }
            .collect()
            .eraseToAnyPublisher()
    }
    
    func roomsDataPublisher() -> AnyPublisher<[Room], NetworkError> {
        URLSession.shared.dataTaskPublisher(
            for: URL(string: Link.rooms.rawValue)!
        )
        .mapError { NetworkError.sessionError($0) }
        .tryMap {
            guard !$0.data.isEmpty else { throw NetworkError.noData }
            return $0.data
        }
        .decode(type: RoomList.self, decoder: decoder)
        .map { $0.rooms }
        .mapError { _ in NetworkError.decodingError }
        .eraseToAnyPublisher()
    }

    func bookingDataPublisher() -> AnyPublisher<Booking, NetworkError> {
        URLSession.shared.dataTaskPublisher(
            for: URL(string: Link.booking.rawValue)!
        )
        .mapError { NetworkError.sessionError($0) }
        .tryMap {
            guard !$0.data.isEmpty else { throw NetworkError.noData }
            return $0.data
        }
        .decode(type: Booking.self, decoder: decoder)
        .mapError { _ in NetworkError.decodingError }
        .eraseToAnyPublisher()
    }
}
