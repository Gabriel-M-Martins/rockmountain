//
//  Attraction.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 11/04/23.
//

import Foundation
import SwiftUI

struct Attraction: Detailable, Identifiable {
    var id = UUID()
    var name: String
    var info: String
    var favorite: Bool
    var image: Image
    var show: Show
    
    
}
