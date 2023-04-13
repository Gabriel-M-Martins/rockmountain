//
//  Filter.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 12/04/23.
//

import Foundation

protocol Filter: CaseIterable, Hashable {
    var title: String { get }
    var imageName: String { get }
}
