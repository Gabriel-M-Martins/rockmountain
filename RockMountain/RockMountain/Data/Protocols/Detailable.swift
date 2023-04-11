//
//  Detailable.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 11/04/23.
//

import Foundation
import SwiftUI

protocol Detailable {
    var name: String { get }
    var info: String { get }
    var favorite: Bool { get set }
    var image: Image { get }
}
