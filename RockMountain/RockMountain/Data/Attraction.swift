//
//  Attraction.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 11/04/23.
//

import Foundation
import SwiftUI

struct Attraction: Detailable {
    var name: String
    var info: String
    var favorite: Bool
    var image: Image
    var show: [Show]
    var type: AttractionType
}

enum AttractionType {
    case artist, ride
}
