//
//  NetworkManager.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 16.12.2023.
//

import Foundation
import Combine

enum Link: String {
    case url = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
}

enum NetworkError: Error {
    case sessionError(Error)
    case noData
    case decodingError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func hotelDataPublisher() -> AnyPublisher<Hotel, NetworkError> {
        URLSession.shared.dataTaskPublisher(for: URL(string: Link.url.rawValue)!)
            .mapError { NetworkError.sessionError($0) }
            .map { $0.data }
            .decode(type: Hotel.self, decoder: JSONDecoder())
            .map { $0 }
            .mapError { _ in
                NetworkError.decodingError
            }
            .receive(on: DispatchQueue.global())
            .eraseToAnyPublisher()
    }
}
