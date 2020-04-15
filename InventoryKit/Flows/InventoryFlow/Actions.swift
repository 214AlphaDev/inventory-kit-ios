//
//  Actions.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/26/19.
//  Copyright © 2019 214Alpha. All rights reserved.
//

import Foundation
import FlowKit

class DisplayInventoryItemDetailsScreenAction: Action {
    let item: InventoryItem
    
    init(item: InventoryItem) {
        self.item = item
    }
}
class CloseInventoryItemDetailsScreenAction: Action {}

class DisplayInventoryItemCreateScreenAction: Action {}
class DisplayInventoryItemEditScreenAction: Action {
    let item: InventoryItem
    
    init(item: InventoryItem) {
        self.item = item
    }
}

class CloseInventoryItemCreateScreenAction: Action {}
class CloseInventoryItemEditScreenAction: Action {
    let updatedItem: InventoryItem
    
    init(updatedItem: InventoryItem) {
        self.updatedItem = updatedItem
    }
}
