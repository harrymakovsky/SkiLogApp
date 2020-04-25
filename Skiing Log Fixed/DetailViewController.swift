//
//  DetailViewController.swift
//  Skiing Log Fixed
//
//  Created by Harry Makovsky on 4/25/20.
//  Copyright © 2020 Harry Makovsky. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate{
    @IBAction func backGroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBOutlet var mountainField: UITextField!
    @IBOutlet var ratingField: UITextField!
    @IBOutlet var bestRunField: UITextField!
    @IBOutlet var dateField: UILabel!
    
    var day: Day! {
        didSet{
            navigationItem.title = day.mountain
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        
        day.mountain = mountainField.text ?? ""
        
        let ratingString = ratingField.text ?? "1"
        
        switch ratingString{
        case "★★★★★":
            day.rating = 5
        case "★★★★☆":
            day.rating = 4
        case "★★★☆☆":
            day.rating = 3
        case "★★☆☆☆":
            day.rating = 2
        case "★☆☆☆☆":
            day.rating = 1
        default:
            day.rating = Int(ratingString) ?? 1
        }
    
        
        day.bestRun = bestRunField.text ?? ""
        
        
        self.view.backgroundColor = UIColor.init(red: 0.0, green: 0.7, blue: 1, alpha: 1)
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        mountainField.text = day.mountain
        
        if(day.rating>3){
            let str = String(repeating: "★", count: day.rating)
            let str2 = String(repeating: "☆", count: 5-day.rating)
            ratingField.text = str + str2
            ratingField.textColor = UIColor.green
        }else if (day.rating==0){
            ratingField.text = "Enter 1-5"

        }else{
            let str = String(repeating: "★", count: day.rating)
            let str2 = String(repeating: "☆", count: 5-day.rating)
            ratingField.text = str + str2
            ratingField.textColor = UIColor.red
        }
        
        
        bestRunField.text = day.bestRun
        dateField.text = day.date
        
        self.view.backgroundColor = UIColor.init(red: 0.0, green: 0.7, blue: 1, alpha: 1)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}
