//
//  ViewController.swift
//  Editing-TableViews-Lab
//
//  Created by casandra grullon on 11/21/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit


class GroceryListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var groceryList = [[GroceryItem]]() 
    
    var isEditingTableView = false {
        didSet{
            tableView.isEditing = isEditingTableView
            
            navigationItem.leftBarButtonItem?.title = isEditingTableView ? "Done" : "Edit"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        groceryList = GroceryItem.getSections()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? AddNewItemVC else {
            fatalError("Issues with segue")
        }
        secondVC.title = "Add items"
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard let secondVC = segue.source as? AddNewItemVC, let addedItem = secondVC.newItem else {
            fatalError("unwind didn't work")
        }
        groceryList.insert([addedItem], at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        isEditingTableView.toggle()
    }
    
}
extension GroceryListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryList[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryCell", for: indexPath)
        let item = groceryList[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = item.name
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return groceryList.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if groceryList[section].first?.wasPurchased == false {
            return "Grocery List"
        } else {
           return "Purchased Items"
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
            case .insert :
                print("...")
            case .delete :
                print("deleting")
                groceryList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            default:
                print("...")
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var groceryItem = groceryList[sourceIndexPath.row]
        
        groceryList.remove(at: sourceIndexPath.row)
        
        groceryList.insert(groceryItem, at: destinationIndexPath.row)
    }
}
