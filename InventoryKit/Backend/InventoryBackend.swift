//
//  InventoryBackend.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import Apollo

public class InventoryBackend: InventoryBackendProtocol {
    
    var apollo: ApolloClient
    
    public init(url: URL, rawAccessToken: String) {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization-Bearer": rawAccessToken]
        self.apollo = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }
    
    public func inventoryItems(from id: UUIDV4?, count: Int, callback: @escaping (Response<[InventoryItem]>) -> Void) {
        apollo.fetch(query: API.InventoryItemsQuery(fromId: id?.id, count: count), cachePolicy: .fetchIgnoringCacheData) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.items else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            do {
                let items = try response.map {
                    try InventoryItem(output: $0)
                }
                callback(.success(items))
            } catch {
                callback(.failure(error))
            }
        }
    }
    
    public func createInventoryItem(_ creatingItem: CreatingInventoryItem, callback: @escaping (Response<InventoryItem>) -> Void) {
        apollo.perform(mutation: API.CreateInventoryItemMutation(name: creatingItem.name, description: creatingItem.description, story: creatingItem.story, photo: creatingItem.photo?.pictureDataString, category: .init(creatingItem.category))) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.create else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            if let error = response.error {
                callback(.failure(ResponseError(createItemError: error)))
                return
            }
            
            guard let itemOutput = response.item else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            do {
                callback(.success(try InventoryItem(output: itemOutput)))
            } catch {
                callback(.failure(error))
            }
        }
    }
    
    public func editInventoryItem(id: UUIDV4, modifiedItem: CreatingInventoryItem, callback: @escaping (Response<InventoryItem>) -> Void) {
        apollo.perform(mutation: API.EditInventoryItemMutation(id: id.description, name: modifiedItem.name, description: modifiedItem.description, story: modifiedItem.story, photo: modifiedItem.photo?.pictureDataString, category: .init(modifiedItem.category))) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.updateItem else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            if let error = response.error {
                callback(.failure(ResponseError(updateItemError: error)))
                return
            }
            
            guard let itemOutput = response.item else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            do {
                callback(.success(try InventoryItem(output: itemOutput)))
            } catch {
                callback(.failure(error))
            }
        }
    }
    
    public func deleteInventoryItem(id: UUIDV4, callback: @escaping (Response<Void>) -> Void) {
        apollo.perform(mutation: API.DeleteInventoryItemMutation(id: id.description)) { result, error in
            
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            if let deleteError = response.deleteItem  {
                callback(.failure(ResponseError(deleteItemError: deleteError)))
                return
            }
            
            callback(.success(()))
        }
    }
    
    public func voteForInventoryItem(with id: UUIDV4, callback: @escaping (Response<InventoryItem>) -> Void) {
        apollo.perform(mutation: API.VoteForInventoryItemMutation(id: id.id)) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.vote else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            if let error = response.error {
                callback(.failure(ResponseError(voteError: error)))
                return
            }
            
            guard let itemOutput = response.item else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            do {
                callback(.success(try InventoryItem(output: itemOutput)))
            } catch {
                callback(.failure(error))
            }
        }
    }
    
    public func withdrawVoteFromInventoryItem(with id: UUIDV4, callback: @escaping (Response<InventoryItem>) -> Void) {
        apollo.perform(mutation: API.WithdrawVoteFromInventoryItemMutation(id: id.id)) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.withdrawVote else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            if let error = response.error {
                callback(.failure(ResponseError(withdrawVoteError: error)))
                return
            }
            
            guard let itemOutput = response.item else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            do {
                callback(.success(try InventoryItem(output: itemOutput)))
            } catch {
                callback(.failure(error))
            }
        }
    }
    
}

