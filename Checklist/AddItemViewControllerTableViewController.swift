//
//  AddItemViewControllerTableViewController.swift
//  Checklist
//
//  Created by Mac on 2/3/20.
//  Copyright © 2020 JaKhushiTai. All rights reserved.
//

import UIKit

class AddItemViewControllerTableViewController: UITableViewController {
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    // MARK:- Table View Delegates
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath)
    -> IndexPath? { return nil
    }

    @IBAction func Done(_ sender: Any) {
        print("Content of the textField:\(textfield.text)")
    }
    
    @IBAction func cancel(_ sender: Any) {
    }
}
