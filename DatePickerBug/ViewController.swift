//
//  ViewController.swift
//  DatePickerBug
//
//  Created by Cody Rayment on 2018-04-12.
//  Copyright © 2018 Robots & Pencils Inc. All rights reserved.
//

import UIKit

/*
 1. Set timezone to automatic and 24 hour mode off.
 2. Launch app and change date.
 3. Settings: Change timezone to London. Toggle 24 hour on and off.
 4. Switch back to app. Date is off by ~1 month.
 */

class ViewController : UIViewController {
    let label = UILabel()
    let datePicker = UIDatePicker()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        
        label.frame = CGRect(x: 10, y: 300, width: 400, height: 20)
        label.text = "Change date picker!"
        label.textColor = .black
        view.addSubview(label)
        
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: [.valueChanged])
        datePicker.datePickerMode = .date
        view.addSubview(datePicker)
        
        // Lock in timeZone but not calendar
        datePicker.timeZone = TimeZone.current
        
        self.view = view
    }
    
    @objc
    func dateChanged(_ datePicker: UIDatePicker) {
        label.text = datePicker.date.description
    }
}
