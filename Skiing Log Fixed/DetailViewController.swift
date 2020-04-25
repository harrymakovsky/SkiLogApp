//
//  DetailViewController.swift
//  Skiing Log Fixed
//
//  Created by Harry Makovsky on 4/25/20.
//  Copyright © 2020 Harry Makovsky. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet var mountainField: UITextField!
    @IBOutlet var ratingField: UITextField!
    @IBOutlet var bestRunField: UITextField!
    @IBOutlet var dateField: UILabel!
    
    var day: Day!
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        mountainField.text = day.mountain
        
        if(day.rating>3){
            let str = String(repeating: "★", count: day.rating)
            let str2 = String(repeating: "☆", count: 5-day.rating)
            ratingField.text = str + str2
            ratingField.textColor = UIColor.green
        }else{
            let str = String(repeating: "★", count: day.rating)
            let str2 = String(repeating: "☆", count: 5-day.rating)
            ratingField.text = str + str2
            ratingField.textColor = UIColor.red
        }
        
        
        bestRunField.text = day.bestRun
        dateField.text = day.date
        
    }
}
