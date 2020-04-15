//
//  InventoryItem.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

/// Represents the item in the inventory.
public struct InventoryItem {
    
    public let id: UUIDV4
    public let name: String
    public let description: String
    public let story: String?
    public let photo: ItemPhoto?
    public let votes: Int
    public let isVoted: Bool
    public let category: InventoryCategory
    
    public init(id: UUIDV4, name: String, description: String, story: String?, photo: ItemPhoto?, votes: Int, isVoted: Bool, category: InventoryCategory) {
        self.id = id
        self.name = name
        self.description = description
        self.story = story
        self.photo = photo
        self.votes = votes
        self.isVoted = isVoted
        self.category = category
    }
    
}

