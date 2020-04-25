//
//  Day.swift
//  Skiing Log
//
//  Created by Harry Makovsky on 3/28/20.
//  Copyright © 2020 Harry Makovsky. All rights reserved.
//

import Foundation
import UIKit

class Day: NSObject, NSCoding {
    var mountain: String
    var temp: Int
    var rating: Int
    var bestRun: String
    var dayDescription: String
    var date: String
    
    init(mountain:  String, temp: Int, rating: Int, bestRun: String, dayDescription: String,
         date: String){
        self.mountain = mountain
        self.temp = temp
        self.rating = rating
        self.bestRun = bestRun
        self.date = date
        self.dayDescription=dayDescription
        
        super.init()
    }

    
    func encode(with aCoder: NSCoder){
        aCoder.encode(mountain, forKey: "mountain")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(rating, forKey: "rating")
        aCoder.encode(bestRun, forKey: "bestRun")
        aCoder.encode(temp, forKey: "temp")
        aCoder.encode(dayDescription, forKey: "dayDescription")
        print("save rating \(rating)")
    }
    
    required init(coder aDecoder: NSCoder){
        mountain = aDecoder.decodeObject(forKey: "mountain") as! String
        date = aDecoder.decodeObject(forKey: "date") as! String
        rating = aDecoder.decodeInteger(forKey: "rating")
        bestRun = aDecoder.decodeObject(forKey: "bestRun") as! String
        temp = aDecoder.decodeInteger(forKey: "temp")
        dayDescription = aDecoder.decodeObject(forKey: "dayDescription") as! String
        super.init()
    }
    
    convenience init(random: Bool = false){
        if random{
            let mountains = ["Mt. Ellen","Mt. Lincoln","Mad River"]
            let randomTemp = Int(arc4random_uniform(UInt32(32)))
            
            var idx = arc4random_uniform(UInt32(5))
            let randomRating = Int(idx) + 1
                
            
            
            idx = arc4random_uniform(UInt32(mountains.count))
            let randomMt = mountains[Int(idx)]
            
            
            let randomRun = "Paradise"
            
            let randomDays = ["Great Day!","Sick Day!","Bad Day!"]
            idx = arc4random_uniform(UInt32(randomDays.count))
            let randomDay = randomDays[Int(idx)]
            
            let randomDates = ["12/25/2019","1/1/2020","2/14/2020","11/23/2019"]
            idx = arc4random_uniform(UInt32(randomDates.count))
            let randomDate = randomDates[Int(idx)]
            
            
            self.init(mountain: randomMt,temp: randomTemp,rating: randomRating,
            bestRun: randomRun,dayDescription: randomDay, date: randomDate)
            
        }else{
            let date = Date()
            
            let formatter = DateFormatter()
            
            formatter.dateFormat = "MM/dd/yyyy"
            let result = formatter.string(from: date)
            
            self.init(mountain: "Enter name",temp: 0, rating: 0, bestRun: "", dayDescription: "", date: result)
        }

    
        
    }
}
