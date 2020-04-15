//
//  InventoryListPresenter.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit
import CommunityKit

public class InventoryListPresenter: InventoryListPresenterProtocol {
    
    public var delegate: WeakWrapper<InventoryListPresenterDelegate> = WeakWrapper()
    public let view: InventoryListViewProtocol
    private let inventoryService: InventoryServiceProtocol
    
    public init(view: InventoryListViewProtocol, inventoryService: InventoryServiceProtocol, memberService: MemberServiceProtocol) {
        self.view = view
        self.inventoryService = inventoryService
        view.presenter = WeakWrapper(self)
        
        displayInventoryItems()
        
        let isAdmin = (try? memberService.getCurrentMember())??.isAdmin ?? false
        view.setCreateAllowed(isAdmin)
    }
    
    public func openDetailsScreen(for item: InventoryItem) {
        do {
            try delegate.wrapped?.presenter(self, requestNavigateToInventoryItemDetailsScreenWith: item)
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }
    
    public func openCreateInventoryItemScreen() {
        do {
            try delegate.wrapped?.presenterRequestNavigateToCreateInventoryItemScreen(self)
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }
    
    public func fetchInventoryItems(callback: @escaping () -> Void) {
        view.setLoadingIndicatorVisible(true)
        inventoryService.fetchInventoryItems(fromId: nil, count: 100) { [weak self] response in
            guard let self = self else {
                callback()
                return
            }
            
            switch response {
            case .failure(let error):
                self.view.displayError(title: "Error", error: error)
            case .success(let Inventoryes):
                self.displayInventoryItems(Inventoryes)
            }
            self.view.setLoadingIndicatorVisible(false)
            callback()
        }
    }
    
    public func reloadInventoryItems() {
        displayInventoryItems()
    }
    
    private func displayInventoryItems(_ items: [InventoryItem]? = nil) {
        if let items = items ?? (try? inventoryService.getAllInventoryItems()) {
            view.showInventoryItems(items)
        }
    }
    
    public var viewController: UIViewController {
        return view.viewController
    }
    
}
