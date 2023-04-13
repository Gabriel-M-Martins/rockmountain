//
//  Restaurant.swift
//  RockMountain
//
//  Created by Filipe Serafini on 11/04/23.
//

import Foundation
import SwiftUI

struct Restaurant: Equatable, Hashable, Detailable {
    static func == (lhs: Restaurant, rhs: Restaurant) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }
    
    var id = UUID()
    var image: Image
    var name: String
    var favorite: Bool
    var info: String
    var items: [RestaurantMenuItem]
    var isVegan: Bool = false
    
}
