//
//  CreatingInventoryItem.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

/// Represents item of inventory that is in a process of creation.
public struct CreatingInventoryItem {
    
    public var name: String
    public var description: String
    public var story: String?
    public var photo: ItemPhoto?
    public var category: InventoryCategory
    
    public init(name: String, description: String, story: String?, photo: ItemPhoto?, category: InventoryCategory) {
        self.name = name
        self.description = description
        self.story = story
        self.photo = photo
        self.category = category
    }
    
    public init() {
        self.init(name: "", description: "", story: nil, photo: nil, category: .init(kind: .book))
    }
    
    public init(inventoryItem: InventoryItem) {
        self.name = inventoryItem.name
        self.description = inventoryItem.description
        self.story = inventoryItem.story
        self.photo = inventoryItem.photo
        self.category = inventoryItem.category
    }
    
}
