//
//  ViewController.swift
//  staticCell-noStoryboard
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 13/12/20.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    
    var firstNameCell: UITableViewCell = UITableViewCell()
    var lastNameCell: UITableViewCell = UITableViewCell()
    var shareCell: UITableViewCell = UITableViewCell()
    
    var firstNameText: UITextField = UITextField()
    var lastNameText: UITextField = UITextField()

        
    override func loadView() {
        super.loadView()
        
        // set the title
        self.title = "User Options"
        
        // construct first name cell, section 0, row 0
        self.firstNameCell.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        self.firstNameText = UITextField(frame: self.firstNameCell.contentView.bounds.insetBy(dx: 15, dy: 0))
        self.firstNameText.placeholder = "First Name"
        self.firstNameCell.addSubview(self.firstNameText)
        
        // construct last name cell, section 0, row 1
        self.lastNameCell.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        self.lastNameText = UITextField(frame: self.lastNameCell.contentView.bounds.insetBy(dx: 15, dy: 0))
        self.lastNameText.placeholder = "Last Name"
        self.lastNameCell.addSubview(self.lastNameText)
        
        // construct share cell, section 1, row 0
        self.shareCell.textLabel?.text = "Share with Friends"
        self.shareCell.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        self.shareCell.accessoryType = UITableViewCell.AccessoryType.checkmark
        
//        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
        self.view.backgroundColor = .lightGray
    }
    
    // Return the number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Return the number of rows for each section in your static table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0: return 2    // section 0 has 2 rows
        case 1: return 1    // section 1 has 1 row
        default: fatalError("Unknown number of sections")
        }
    }
    
    // Return the row for the corresponding section and row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.section) {
        case 0:
            switch(indexPath.row) {
            case 0: return self.firstNameCell   // section 0, row 0 is the first name
            case 1: return self.lastNameCell    // section 0, row 1 is the last name
            default: fatalError("Unknown row in section 0")
            }
        case 1:
            switch(indexPath.row) {
            case 0: return self.shareCell       // section 1, row 0 is the share option
            default: fatalError("Unknown row in section 1")
            }
        default: fatalError("Unknown section")
        }
    }
    
    // Customize the section headings for each section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section) {
        case 0: return "Profile"
        case 1: return "Social"
        default: fatalError("Unknown section")
        }
    }

    // Configure the row selection code for any cells that you want to customize the row selection
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle social cell selection to toggle checkmark
        if(indexPath.section == 1 && indexPath.row == 0) {
            
            // deselect row
            tableView.deselectRow(at: indexPath as IndexPath, animated: false)
            
            // toggle check mark
            if(self.shareCell.accessoryType == UITableViewCell.AccessoryType.none) {
                self.shareCell.accessoryType = UITableViewCell.AccessoryType.checkmark;
            } else {
                self.shareCell.accessoryType = UITableViewCell.AccessoryType.none;
            }
        
         }
    }
    
}
