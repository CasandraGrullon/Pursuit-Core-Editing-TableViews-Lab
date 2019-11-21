//
//  GroceryList.swift
//  Editing-TableViews-Lab
//
//  Created by casandra grullon on 11/21/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

struct GroceryItem {
    var name: String
    var wasPurchased: Bool
    
    static func groceries() -> [GroceryItem] {
        var name = ["frijoles", "rice"]
        var list = [GroceryItem]()
        
        for name in list {
            let newItem = GroceryItem(name: "", wasPurchased: false)
            list.append(newItem)
        }
        return list
    }
}
