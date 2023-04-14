//
//  AttractionFilter.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 12/04/23.
//

import Foundation

enum AttractionFilter: String, Filter {
    case stage = "Palco", time = "Horário", alphabetic = "A - Z"
    
    var imageName: String {
        switch self {
        case .stage:
            return "paperplane.fill"
        case .time:
            return "calendar.badge.clock"
        case .alphabetic:
            return "list.bullet"
        }
    }
    
    static var standard: AttractionFilter {
        return AttractionFilter.stage
    }
    
    func executeFilter(attractions: [Attraction], searched: String) -> [(title: String, attractionsIndices: [Int] )] {
        var response = [(title: String, attractionsIndices: [Int] )]()
        
        switch self {
        case .stage:
            response = self.filterByStage(attractions: attractions)
            
        case .time:
            response = self.filterByTime(attractions: attractions)
            
        case .alphabetic:
            response = self.filterByName(attractions: attractions)
        }
        
        let searchedResponse = response.map { (title: String, attractionsIndices: [Int]) in
            let newIndices = attractionsIndices.filter { idx in
                if searched.isEmpty{
                    return true
                }

                return attractions[idx].name.lowercased().contains(searched.lowercased())
            }

            return (title, newIndices)
        }
        .filter { (_, attractionsIndices: [Int]) in
            !attractionsIndices.isEmpty
        }
        
        return searchedResponse
    }
    
    private func filterByName(attractions: [Attraction]) -> [(title: String, attractionsIndices: [Int] )] {
        var response = [(title: String, attractionsIndices: [Int] )] ()
        
        var names = [Character] ()
        
        for i in attractions {
            if i.name.isEmpty {
                continue
            }
            
            if !names.contains(i.name.first!) {
                names.append(i.name.first!)
            }
        }
        
        names.sort()
        
        for i in names {
            let title = i
            
            let filteredList = attractions.enumerated().filter { (_, attraction) in
                if attraction.name.isEmpty {
                    return false
                }
                
                return i == attraction.name.first!
            }.sorted {
                DateParser.getHour(date: $0.element.show.date.start) < DateParser.getHour(date: $1.element.show.date.start)
            }.map { (index, _) in
                return index
            }
            
            response.append((title.description, filteredList))
        }
        
        return response
    }
    
    private func filterByStage(attractions: [Attraction]) -> [(title: String, attractionsIndices: [Int] )] {
        var response = [(title: String, attractionsIndices: [Int] )] ()
        
        var stages = [Stage] ()
        
        for i in attractions {
            if !stages.contains(i.show.stage) {
                stages.append(i.show.stage)
            }
        }
        
        for i in stages {
            let title = i.rawValue
            
            let filteredList = attractions.enumerated().filter { (_, attraction) in
                i == attraction.show.stage
            }.sorted {
                DateParser.getHour(date: $0.element.show.date.start) < DateParser.getHour(date: $1.element.show.date.start)
            }.map { (index, _) in
                return index
            }
            
            response.append((title, filteredList))
        }
        
        return response
    }
    
    private func filterByTime(attractions: [Attraction]) -> [(title: String, attractionsIndices: [Int] )] {
        var response = [(title: String, attractionsIndices: [Int] )] ()
        var times = [Int]()
        
        for i in attractions {
            let hour = DateParser.getHour(date: i.show.date.start)

            if !times.contains(hour) {
                times.append(hour)
            }
        }
        
        times.sort()
        
        
        for i in times {
            let title = "\(i):00"
            
            let filteredList = attractions.enumerated().filter { (_, attraction) in
                DateParser.getHour(date: attraction.show.date.start) == i
            }.map { (index, _) in
                return index
            }
            
            response.append((title, filteredList))
        }
        
        return response
    }
}
