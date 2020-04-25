# SkiLogApp

Testing:
To see the full functionality of the display I'd suggest making random ones to not type in a bunch, the rating number changes
how the day is displayed in detail and in the list.

Default it is set to empty and to default days.

In skiLog.swift

    @discardableResult func createDay() -> Day{
    
        let newDay = Day(random: false) <- set to true
        
        allDays.append(newDay)
        
        return newDay
    }
    
    
