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
    
    var id: String = UUID().uuidString
    var image: Image
    var name: String
    var favorite: Bool
    var info: String
    
    var items: [RestaurantMenuItem] = [
        RestaurantMenuItem(image: "Fitzza", name: "Pizza", description: "pizza!", price: "32,90"),
        RestaurantMenuItem(image: "Amazonika", name: "Hamburguer", description: "hamburguer!", price: "35,90")
    ]
}
