//
//  PeculiaritiesViewModel.swift
//  HotelReservation
//
//  Created by Ruslan Shigapov on 18.12.2023.
//

import Foundation

enum Relation {
    case toHotel
    case toRoom
}

final class PeculiaritiesViewModel {
    
    @Published 
    var peculiarities: [String] = []
    
    var relation: Relation
    
    func getNumberOfItems() -> Int {
        switch relation {
        case .toHotel: peculiarities.count
        case .toRoom: peculiarities.count + 1
        }
    }
    
    required init(peculiarities: [String], relation: Relation) {
        self.peculiarities = peculiarities
        self.relation = relation
    }
}
