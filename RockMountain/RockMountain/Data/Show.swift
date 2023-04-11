//
//  Show.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 11/04/23.
//

import Foundation

struct Show {
    var stage: Stage
    var startTime: Date
    var endTime: Date
    var day: Day
    
    func formattedStartTime() -> String {
        let hour = Calendar.current.component(.hour, from: startTime)
        let minute = Calendar.current.component(.minute, from: startTime)
        
        return "\(hour):\(minute)"
    }
    
    func formattedEndTime() -> String {
        let hour = Calendar.current.component(.hour, from: endTime)
        let minute = Calendar.current.component(.minute, from: endTime)
        
        return "\(hour):\(minute)"
    }
}
