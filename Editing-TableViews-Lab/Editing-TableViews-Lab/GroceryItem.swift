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
    
    static var groceries = [
        GroceryItem(name: "rice", wasPurchased: false),
        GroceryItem(name: "apple", wasPurchased: true)
    ]
    static func getSections() -> [[GroceryItem]] {
        let list = groceries.sorted { $0.name < $1.name }
        let sectionTitles: Set<Bool> = Set(list.map { $0.wasPurchased })
        var sections = Array(repeating: [GroceryItem](), count: sectionTitles.count)
        
        var currentIndex = 0
        var currentSection = list.first?.wasPurchased ?? false
        
        for item in list {
            if item.wasPurchased == false {
                sections[currentIndex].append(item)
            } else {
                currentIndex += 1
                currentSection = item.wasPurchased
                sections[currentIndex].append(item)
            }
            
        }
        return sections
    }
    
}
