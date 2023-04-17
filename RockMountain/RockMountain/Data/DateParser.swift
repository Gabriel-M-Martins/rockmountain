//
//  DateParser.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 13/04/23.
//

import Foundation

struct DateParser {
    static func createDate(time: (hours: Int, minutes: Int), day: Day, year: Int) -> Date? {
        let dateComponents = DateComponents(year: year, day: day.rawValue, hour: time.hours, minute: time.minutes)
        let date = Calendar.current.date(from: dateComponents)
        
        if let date = date{
            return date
        }
        
        return nil
    }
    
    static func createDateInterval(start: Date, duration: (hours: Int, minutes: Int)) -> DateInterval {
        let convertedDuration = (duration.hours * 60 * 60) + (duration.minutes * 60)
        
        if convertedDuration < 0 {
            return DateInterval(start: start, duration: 0.0)
        }
        
        let end = start.addingTimeInterval(Double(convertedDuration))
        
        return DateInterval(start: start, end: end)
    }
    
    static func formatDateInterval(interval: DateInterval) -> (start: String, end: String) {
        let startHour = self.getHour(date: interval.start)
        let startMinute = self.getMinute(date: interval.start)
        
        let endHour = self.getHour(date: interval.end)
        let endMinute = self.getMinute(date: interval.end)
        
        let formattedStart = "\(startHour):\(startMinute)"
        let formattedEnd = "\(endHour):\(endMinute)"
        
        return (formattedStart, formattedEnd)
    }
    
    static func getHour(date: Date) -> Int {
        return Calendar.current.component(.hour, from: date)
    }
    
    static func getMinute(date: Date) -> Int {
        return Calendar.current.component(.minute, from: date)
    }
}
