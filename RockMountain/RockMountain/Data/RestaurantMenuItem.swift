//
//  RestaurantMenuItem.swift
//  RockMountain
//
//  Created by Filipe Serafini on 11/04/23.
//

import Foundation

struct RestaurantMenuItem: Identifiable {
    
    var id = UUID()

    let name : String
    let description : String
    let price : String
    
}
