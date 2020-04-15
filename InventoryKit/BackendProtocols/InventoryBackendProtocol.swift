//
//  InventoryBackendProtocol.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public protocol InventoryBackendProtocol {
    
    /// Requests inventory items from backend.
    ///
    /// - Parameters:
    ///   - id: Id of item to start from or nil to start from the beginning.
    ///   - count: Number of inventory items to get.
    ///   - callback: Callback when request is done with array of inventory items or error.
    func inventoryItems(from id: UUIDV4?, count: Int, callback: @escaping (Response<[InventoryItem]>) -> Void)
    
    /// Requests inventory item creation.
    ///
    /// - Parameters:
    ///   - creatingItem: Information needed to create the inventory item.
    ///   - callback: Callback when request is done with inventory item or error.
    func createInventoryItem(_ creatingItem: CreatingInventoryItem, callback: @escaping (Response<InventoryItem>) -> Void)
    
    /// Requests inventory item modification.
    ///
    /// - Parameters:
    ///   - id: Id of item to modify.
    ///   - modifiedItem: Modified item data.
    ///   - callback: Callback with updated item or error.
    func editInventoryItem(id: UUIDV4, modifiedItem: CreatingInventoryItem, callback: @escaping (Response<InventoryItem>) -> Void)
    
    /// Requests inventory item deletion.
    ///
    /// - Parameters:
    ///   - id: Id of item to delete.
    ///   - callback: Callback with empty response on success or error on fail.
    func deleteInventoryItem(id: UUIDV4, callback: @escaping (Response<Void>) -> Void)
    
    /// Requests vote for the inventory item.
    ///
    /// - Parameters:
    ///   - id: Id of inventory item to vote.
    ///   - callback: Callback when request is done with updated inventory item or error.
    func voteForInventoryItem(with id: UUIDV4, callback: @escaping (Response<InventoryItem>) -> Void)
    
    /// Requests withdraw vote from the inventory item.
    ///
    /// - Parameters:
    ///   - id: Id of inventory item to withdraw vote from.
    ///   - callback: Callback when request is done with updated inventory item or error.
    func withdrawVoteFromInventoryItem(with id: UUIDV4, callback: @escaping (Response<InventoryItem>) -> Void)
    
}
