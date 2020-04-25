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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    
    override func tableView(_ tableView: UITableView,
            numberOfRowsInSection section: Int) -> Int {
        return skiLog.allDays.count
        
    }
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        // Make a new index path for the 0th section, last row
        let newDay = skiLog.createDay()
        // Figure out where that item is in the array
        if let index = skiLog.allDays.firstIndex(of: newDay) {
            let indexPath = IndexPath(row: index, section: 0)
            // Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
            
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

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as! DayCell

        
        let day = skiLog.allDays[indexPath.row]
        cell.nameLabel.text = day.mountain
        cell.dateLabel.text = day.date
        

        if(day.rating==5){
            cell.ratingLabel.text = "😍"
            
        }else if(day.rating>=3){
            cell.ratingLabel.text = "😄"
            
        }else if(day.rating == 1){
            cell.ratingLabel.text = "😡"
        }else{
            cell.ratingLabel.text = "😐"
        }

        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        switch segue.identifier{
        case "showDay"?:
            if let row = tableView.indexPathForSelectedRow?.row{
                let day = skiLog.allDays[row]
                let detailViewController
                    = segue.destination as! DetailViewController
                detailViewController.day = day
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor.init(red: 0.0, green: 0.7, blue: 1, alpha: 1)
        // Get the height of the status bar
        

        tableView.rowHeight = 65
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.init(red: 0.0, green: 0.7, blue: 1, alpha: 1)    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
}
