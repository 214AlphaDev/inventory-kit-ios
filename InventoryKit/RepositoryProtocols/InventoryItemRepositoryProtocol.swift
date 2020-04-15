//
//  InventoryItemRepositoryProtocol.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public protocol InventoryItemRepositoryProtocol {
    
    /// Persists the inventory item in database. It handles both create new or modify existing item.
    ///
    /// - Parameter item: Inventory item to persist.
    /// - Throws: Database errors.
    func persist(item: InventoryItem) throws
    
    /// Gets the inventory item from database.
    ///
    /// - Parameter id: Id of inventory item to get.
    /// - Returns: Inventory item or nil if no item exists with specified id.
    /// - Throws: Database errors.
    func get(id: UUIDV4) throws -> InventoryItem?
    
    /// Gets all inventory items from database
    ///
    /// - Returns: Array of inventory items.
    /// - Throws: Database errors.
    func getAll() throws -> [InventoryItem]
    
    /// Gets specific range of inventory items from database.
    ///
    /// - Parameters:
    ///   - fromId: Id of item to start from or nil to start from the beginning.
    ///   - count: Number of inventory items to get.
    /// - Returns: Array of inventory items.
    /// - Throws: Database errors.
    func get(fromId: UUIDV4?, count: Int) throws -> [InventoryItem]
    
    /// Deletes inventory item from database.
    ///
    /// - Parameter id: Id of item ot delete.
    /// - Throws: Database errors.
    func delete(id: UUIDV4) throws
    
    /// Deletes all items from database.
    ///
    /// - Throws: Database errors.
    func deleteAll() throws
    
}
