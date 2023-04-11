//
//  Artist.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 11/04/23.
//

import Foundation
import SwiftUI

struct Artist {
    var name: String
    var description: String
    var image: Image
    var shows: [Show] = []
}
