//
//  Filter.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 12/04/23.
//

import Foundation

protocol Filter: CaseIterable, Hashable, RawRepresentable where RawValue == String {
    var imageName: String { get }
    static var standard: Self { get }
}
