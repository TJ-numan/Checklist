//
//  AddItemViewControllerTableViewController.swift
//  Checklist
//
//  Created by Mac on 2/3/20.
//  Copyright © 2020 JaKhushiTai. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
  func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
}
class AddItemViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textfield: UITextField!
    weak var delegate: AddItemViewControllerDelegate?
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
    textfield.becomeFirstResponder() }
    // MARK:- Table View Delegates
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath)
    -> IndexPath? { return nil
    }

    @IBAction func Done(_ sender: Any) {
        print("Content of the textField:\(String(describing: textfield.text))")
        navigationController?.popViewController(animated: true)
        let item = ChecklistItem()
        item.text = textfield.text!
        delegate?.addItemViewController(self, didFinishAdding: item)
    }
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    
    // MARK:- Text Field Delegates
    func textfield(_ textfield: UITextField, shouldChangeCharactersIn range: NSRange,
    replacementString string: String) -> Bool {
    let oldText = textfield.text!
    let stringRange = Range(range, in:oldText)!
    let newText = oldText.replacingCharacters(in: stringRange,with: string)
    if newText.isEmpty { doneBarButton.isEnabled = false
    } else {
    doneBarButton.isEnabled = true }
    return true
    }
   
}
