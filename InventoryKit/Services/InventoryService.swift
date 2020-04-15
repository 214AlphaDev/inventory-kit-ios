//
//  InventoryService.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public class InventoryService: InventoryServiceProtocol {
    
    let inventoryItemRepository: InventoryItemRepositoryProtocol
    let inventoryBackend: InventoryBackendProtocol
    
    public init(inventoryBackend: InventoryBackendProtocol,
                inventoryRepository: InventoryItemRepositoryProtocol) {
        self.inventoryBackend = inventoryBackend
        self.inventoryItemRepository = inventoryRepository
    }
    
    public func getInventoryItem(id: UUIDV4) throws -> InventoryItem? {
        return try inventoryItemRepository.get(id: id)
    }
    
    public func getAllInventoryItems() throws -> [InventoryItem] {
        return sortedInventoryItems(try inventoryItemRepository.getAll())
    }
    
    public func getInventoryItems(fromId: UUIDV4?, count: Int) throws -> [InventoryItem] {
        return sortedInventoryItems(try inventoryItemRepository.get(fromId: fromId, count: count))
    }
    
    public func fetchInventoryItems(fromId: UUIDV4?, count: Int, callback: @escaping (Response<[InventoryItem]>) -> Void) {
        inventoryBackend.inventoryItems(from: fromId, count: count) { [weak self] response in
            guard let self = self else {
                callback(.failure(ResponseError.unknownError))
                return
            }
            
            switch response {
                
            case .success(let items):
                do {
                    try self.inventoryItemRepository.deleteAll()
                    
                    try items.forEach { item in
                        try self.saveInventoryItem(item)
                    }
                    callback(.success(self.sortedInventoryItems(items)))
                } catch {
                    callback(.failure(PersistenceError.inventoryItemPersistenceFailed(underlyingError: error)))
                }
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    public func voteForInventoryItem(with id: UUIDV4, callback: @escaping (Response<InventoryItem>) -> Void) {
        inventoryBackend.voteForInventoryItem(with: id) { [weak self] response in
            switch response {
                
            case .success(let item):
                do {
                    try self?.saveInventoryItem(item)
                    callback(.success(item))
                } catch {
                    callback(.failure(PersistenceError.inventoryItemPersistenceFailed(underlyingError: error)))
                }
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    public func withdrawVoteFromInventoryItem(with id: UUIDV4, callback: @escaping (Response<InventoryItem>) -> Void) {
        inventoryBackend.withdrawVoteFromInventoryItem(with: id) { [weak self] response in
            switch response {
                
            case .success(let item):
                do {
                    try self?.saveInventoryItem(item)
                    callback(.success(item))
                } catch {
                    callback(.failure(PersistenceError.inventoryItemPersistenceFailed(underlyingError: error)))
                }
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    public func createInventoryItem(_ creatingItem: CreatingInventoryItem, callback: @escaping (Response<InventoryItem>) -> Void) {
        inventoryBackend.createInventoryItem(creatingItem) { [weak self] response in
            switch response {
                
            case .success(let item):
                do {
                    try self?.saveInventoryItem(item)
                    callback(.success(item))
                } catch {
                    callback(.failure(PersistenceError.inventoryItemPersistenceFailed(underlyingError: error)))
                }
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    public func editInventoryItem(with id: UUIDV4, modifiedItem: CreatingInventoryItem, callback: @escaping (Response<InventoryItem>) -> Void) {
        inventoryBackend.editInventoryItem(id: id, modifiedItem: modifiedItem) { [weak self] response in
            switch response {
                
            case .success(let item):
                do {
                    try self?.saveInventoryItem(item)
                    callback(.success(item))
                } catch {
                    callback(.failure(PersistenceError.inventoryItemPersistenceFailed(underlyingError: error)))
                }
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    public func deleteInventoryItem(with id: UUIDV4, callback: @escaping (Response<Void>) -> Void) {
        inventoryBackend.deleteInventoryItem(id: id) { response in
            switch response {
                
            case .success():
                do {
                    try self.inventoryItemRepository.delete(id: id)
                    callback(.success(()))
                } catch {
                    callback(.failure(PersistenceError.inventoryItemPersistenceFailed(underlyingError: error)))
                }
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    func saveInventoryItem(_ inventoryItem: InventoryItem) throws {
        try inventoryItemRepository.persist(item: inventoryItem)
    }
    
    private func sortedInventoryItems(_ items: [InventoryItem]) -> [InventoryItem] {
        return items.sorted(by: { lhs, rhs -> Bool in
            if lhs.votes != rhs.votes {
                return lhs.votes > rhs.votes
            }
            
            return lhs.id.description < rhs.id.description
        })
    }
    
}
