//
//  InventoryItemDetailsPresenter.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit
import CommunityKit

public class InventoryItemDetailsPresenter: InventoryItemDetailsPresenterProtocol {
    
    public var delegate: WeakWrapper<InventoryItemDetailsPresenterDelegate> = WeakWrapper()
    public let view: InventoryItemDetailsViewProtocol
    private let inventoryService: InventoryServiceProtocol
    private var inventoryItem: InventoryItem
    
    public init(view: InventoryItemDetailsViewProtocol, inventoryItem: InventoryItem, inventoryService: InventoryServiceProtocol, memberService: MemberServiceProtocol) {
        self.view = view
        self.inventoryService = inventoryService
        self.inventoryItem = inventoryItem
        view.presenter = WeakWrapper(self)
        
        view.displayInventoryItem(inventoryItem)
        
        let isAdmin = (try? memberService.getCurrentMember())??.isAdmin ?? false
        view.setEditAllowed(isAdmin)
        view.setDeleteAllowed(isAdmin)
    }
    
    public func vote() {
        inventoryService.voteForInventoryItem(with: inventoryItem.id) { [weak self] response in
            guard let self = self else { return }
            
            switch response {
            case .failure(let error):
                self.view.displayError(title: "Error", error: error)
            case .success(let result):
                self.update(with: result)
            }
        }
    }
    
    public func withdrawVote() {
        inventoryService.withdrawVoteFromInventoryItem(with: inventoryItem.id) { [weak self] response in
            guard let self = self else { return }
            
            switch response {
            case .failure(let error):
                self.view.displayError(title: "Error", error: error)
            case .success(let result):
                self.update(with: result)
            }
        }
    }
    
    public func delete() {
        inventoryService.deleteInventoryItem(with: inventoryItem.id) { [weak self] response in
            guard let self = self else { return }
            
            do {
                switch response {
                case .failure(let error):
                    throw error
                case .success():
                    try self.delegate.wrapped?.presenterRequestNavigateToInventoryListScreen(self)
                }
            } catch {
                self.view.displayError(title: "Error", error: error)
            }
        }
    }
    
    public func edit() {
        do {
            try delegate.wrapped?.presenter(self, requestsNavigateToInventoryItemEditScreenWith: inventoryItem)
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }

    public func update(with item: InventoryItem) {
        self.inventoryItem = item
        view.displayInventoryItem(inventoryItem)
    }
    
    public var viewController: UIViewController {
        return view.viewController
    }
    
}
