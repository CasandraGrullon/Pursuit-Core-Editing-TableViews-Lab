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
    
    var groceryList = [GroceryItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }


}
extension GroceryListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
