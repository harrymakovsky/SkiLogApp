//
//  Ski Log.swift
//  Skiing Log
//
//  Created by Harry Makovsky on 3/28/20.
//  Copyright © 2020 Harry Makovsky. All rights reserved.
//

import Foundation
import UIKit

class SkiLog{
    
    var allDays = [Day]()
    
    let itemArchiveURL: URL = {
        let documentsDirectories =
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    
    init(){

        if let archivedDays =
            NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [Day]{
            allDays = archivedDays
        }
    }
//
    func saveChanges() -> Bool {
        print("Saving items to: \(itemArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allDays, toFile: itemArchiveURL.path)
    }
    
    @discardableResult func createDay() -> Day{
        let newDay = Day(random: true)
        
        allDays.append(newDay)
        
        return newDay
    }
    
    func removeDay(_ day: Day) {
        if let index = allDays.firstIndex(of: day) {
            
            allDays.remove(at: index)
            
        }
    }
    
    func moveDay(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        // Get reference to object being moved so you can reinsert it
        let movedDay = allDays[fromIndex]
        // Remove item from array
        allDays.remove(at: fromIndex)
        // Insert item in array at new location
        allDays.insert(movedDay, at: toIndex)
        
    }
    

    
}
