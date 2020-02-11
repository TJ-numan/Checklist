//
//  ViewController.swift
//  Checklist
//
//  Created by Mac on 1/22/20.
//  Copyright © 2020 JaKhushiTai. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController,AddItemViewControllerDelegate  {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        navigationController?.popViewController(animated:true)
    }
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem) {
      navigationController?.popViewController(animated:true)
    }
    
    
    var items = [ChecklistItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let item1 = ChecklistItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Brush my teeth"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Learn iOS development"
        //item3.checked = false
        items.append(item3)
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    @IBAction func cancel(_ sender: Any) {
        
    }
    
    @IBAction func addItem(_ sender: Any) {
        
        let newRowIndex = items.count
        let item =  ChecklistItem()
        item.text =  "i am a new row"
        items.append(item)

        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    
    //MARK:- Function
    func configureText(for cell: UITableViewCell,
                       with item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text }
    
    func configureCheckmark(for cell: UITableViewCell,
                            at item: ChecklistItem) {
        // Replace full method implementation
        cell.accessoryType = item.checked ? .checkmark : .none
    }
    
    //MARK:- Table View Data Sour	cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
          let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "checklist",for: indexPath)
        print("Time: \(indexPath.row)")
        let item = items[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, at: item)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    //MARK:- TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) { // Replace everything inside this `if` condition // with the following
            let item = items[indexPath.row]
            item.checked = !item.checked
            configureCheckmark(for: cell, at: item)
        }
        tableView.deselectRow(at: indexPath, animated: true) }
    
    
    
    
}
