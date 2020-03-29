//
//  DayViewController.swift
//  Skiing Log Fixed
//
//  Created by Harry Makovsky on 3/28/20.
//  Copyright © 2020 Harry Makovsky. All rights reserved.
//

import Foundation
import UIKit


class DayViewController: UITableViewController {
    
    var skiLog : SkiLog!
    
    
    override func tableView(_ tableView: UITableView,
            numberOfRowsInSection section: Int) -> Int {
        return skiLog.allDays.count
        
    }
    
    @IBAction func addNewItem(_ sender: UIButton) {
        // Make a new index path for the 0th section, last row
        let newDay = skiLog.createDay()
        // Figure out where that item is in the array
        if let index = skiLog.allDays.firstIndex(of: newDay) {
            let indexPath = IndexPath(row: index, section: 0)
            // Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
            
        }
    }
        
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        if isEditing {

            sender.setTitle("Edit", for: .normal)

            setEditing(false, animated: true)
            
        } else {

            setEditing(true, animated: true)
            
        }
    }
    
    override func tableView(_ tableView: UITableView,
        moveRowAt sourceIndexPath: IndexPath,
        to destinatioIndexPath: IndexPath){
        
        skiLog.moveDay(from: sourceIndexPath.row, to: destinatioIndexPath.row)
        
    }

    
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
            forRowAt indexPath: IndexPath) {
    // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            

            // Remove the item from the store
            let day = skiLog.allDays[indexPath.row]
            
            let title = "Delete \(day.mountain)?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title, message: message,
                preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel",style: .cancel,handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title:"Remove", style: .destructive, handler: { (action) -> Void in
                
                self.skiLog.removeDay(day)
                // Also remove that row from the table view with an animation
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            
            ac.addAction(deleteAction)
            
            present(ac,animated: true,completion: nil)
            
            

            
        }
    }
    
    
    override func tableView(_ tableView: UITableView,
    cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as! DayCell

        
        let day = skiLog.allDays[indexPath.row]
//
        cell.nameLabel.text = day.mountain
        cell.dateLabel.text = day.date

        if(day.rating>3){
            let str = String(repeating: "*", count: day.rating)
            cell.ratingLabel.text = str
            cell.ratingLabel.textColor = UIColor.green
        }else{
            let str = String(repeating: "*", count: day.rating)
            cell.ratingLabel.text = str
            cell.ratingLabel.textColor = UIColor.red
        }

        
        
//        cell.textLabel?.text = day.mountain
//
//        if(day.rating>3){
//            let str = String(repeating: "*", count: day.rating)
//            cell.detailTextLabel?.text = str
//            cell.detailTextLabel?.textColor = UIColor.green
//        }else{
//            let str = String(repeating: "*", count: day.rating)
//            cell.detailTextLabel?.text = str
//            cell.detailTextLabel?.textColor = UIColor.red
//        }
//
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = 65
    }
    
}
