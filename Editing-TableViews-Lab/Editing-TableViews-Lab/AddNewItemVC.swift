//
//  AddNewItemVC.swift
//  Editing-TableViews-Lab
//
//  Created by casandra grullon on 11/21/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class AddNewItemVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var newItem: GroceryItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        newItem = GroceryItem(name: "rice", wasPurchased: false)
    }
} 
extension AddNewItemVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        newItem?.name = textField.text ?? "rice"
        newItem?.wasPurchased = false
        
        return true
    }
    
}
