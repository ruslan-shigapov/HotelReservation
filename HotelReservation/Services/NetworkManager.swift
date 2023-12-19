//
//  NetworkManager.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 16.12.2023.
//

import UIKit
import Combine

private enum Link: String {
    case url = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
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
    
    private func imagePublisher(
        by url: String
    ) -> AnyPublisher<UIImage, NetworkError> {
        URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .mapError { NetworkError.sessionError($0) }
            .tryMap {
                guard let image = UIImage(data: $0.data) else {
                    throw NetworkError.noData
                }
                return image
            }
            .mapError { _ in
                NetworkError.imagesNotLoaded
            }
            .eraseToAnyPublisher()
    }
    
    func hotelDataPublisher() -> AnyPublisher<Hotel, NetworkError> {
        URLSession.shared.dataTaskPublisher(for: URL(string: Link.url.rawValue)!)
            .mapError { NetworkError.sessionError($0) }
            .tryMap {
                guard !$0.data.isEmpty else { throw NetworkError.noData }
                return $0.data
            }
            .decode(type: Hotel.self, decoder: decoder)
            .map { $0 }
            .mapError { _ in
                NetworkError.decodingError
            }
            .eraseToAnyPublisher()
    }
    
    func imageViewsPublisher(
        by urls: [String]
    ) -> AnyPublisher<[UIImageView], NetworkError> {
        urls.publisher
            .flatMap {
                self.imagePublisher(by: $0)
            }
            .receive(on: DispatchQueue.main)
            .compactMap { UIImageView(image: $0) }
            .collect()
            .eraseToAnyPublisher()
    }
}
