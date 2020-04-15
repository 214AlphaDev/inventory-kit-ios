//
//  InventoryServiceProtocol.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public protocol InventoryServiceProtocol {
    
    /// Gets the inventory items from database.
    ///
    /// - Parameter id: Id of the item to get.
    /// - Returns: Returns an inventory item or nil if this item doesn't exist in database.
    /// - Throws: Database errors.
    func getInventoryItem(id: UUIDV4) throws -> InventoryItem?
    
    /// Gets all inventory items from the database.
    ///
    /// - Returns: Array of all inventory items in database.
    /// - Throws: Database errors.
    func getAllInventoryItems() throws -> [InventoryItem]
    
    /// Gets specific number of inventory items from database starting with specified id.
    ///
    /// - Parameters:
    ///   - fromId: Id of item to start from or nil to start from the beginning.
    ///   - count: Number of items to get.
    /// - Returns: A list of inventory items.
    /// - Throws: Database errors.
    func getInventoryItems(fromId: UUIDV4?, count: Int) throws -> [InventoryItem]
    
    /// Fetches inventory items from backend.
    ///
    /// - Parameters:
    ///   - fromId: Id of item to start from or nil to start from the beginning.
    ///   - count: Number of items to fetch.
    ///   - callback: Called when request is done with inventory items array.
    func fetchInventoryItems(fromId: UUIDV4?, count: Int, callback: @escaping (Response<[InventoryItem]>) -> Void)
    
    /// Sends the request to vote for the inventory item.
    ///
    /// - Parameters:
    ///   - id: Id of the inventory item to vote.
    ///   - callback: Callback when request is done. Response contains updated item.
    func voteForInventoryItem(with id: UUIDV4, callback: @escaping (Response<InventoryItem>) -> Void)
    
    /// Sends the request to withdraw vote from the inventory item.
    ///
    /// - Parameters:
    ///   - id: Id of the inventory item to withdraw vote from.
    ///   - callback: Callback when request is done. Response contains updated item.
    func withdrawVoteFromInventoryItem(with id: UUIDV4, callback: @escaping (Response<InventoryItem>) -> Void)
    
    /// Sends the request to create new inventory item.
    ///
    /// - Parameters:
    ///   - creatingItem: Information needed to create the inventory item.
    ///   - callback: Callback with inventory item on success and error on fail.
    func createInventoryItem(_ creatingItem: CreatingInventoryItem, callback:  @escaping (Response<InventoryItem>) -> Void)
    
    /// Sends the request to modify existing inventory item.
    ///
    /// - Parameters:
    ///   - id: Id of item to modify
    ///   - modifiedItem: Struct with updated item information
    ///   - callback: Callback with inventory item on success and error on fail.
    func editInventoryItem(with id: UUIDV4, modifiedItem: CreatingInventoryItem, callback:  @escaping (Response<InventoryItem>) -> Void)
    
    /// Sends the request to delete inventory item.
    ///
    /// - Parameters:
    ///   - id: Id of item to delete.
    ///   - callback: Callback which is called with empty result on success and error on fail.
    func deleteInventoryItem(with id: UUIDV4, callback:  @escaping (Response<Void>) -> Void)
    
}
