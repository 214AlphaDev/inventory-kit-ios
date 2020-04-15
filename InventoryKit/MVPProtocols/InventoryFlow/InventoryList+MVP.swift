//
//  InventoryList+MVP.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol InventoryListPresenterDelegate: class {
    
    func presenter(_ presenter: InventoryListPresenterProtocol, requestNavigateToInventoryItemDetailsScreenWith item: InventoryItem) throws
    func presenterRequestNavigateToCreateInventoryItemScreen(_ presenter: InventoryListPresenterProtocol) throws
    
}

public protocol InventoryListPresenterProtocol: Presenter {
    
    var delegate: WeakWrapper<InventoryListPresenterDelegate> { get set }
    var view: InventoryListViewProtocol { get }
    
    func openDetailsScreen(for item: InventoryItem)
    func openCreateInventoryItemScreen()
    /// Initiates fetch of inventory items from backend
    ///
    /// - Parameter callback: Callback that is called when fetch request is done, regardless of whether it was successful
    func fetchInventoryItems(callback: @escaping () -> Void)
    /// Reloads inventory items available on database
    func reloadInventoryItems()
    
}

public protocol InventoryListViewProtocol: class, ViewControllerProvider, ErrorDisplayable, LoadingIndicatorDisplayable {
    
    var presenter: WeakWrapper<InventoryListPresenterProtocol> { get set }
    
    func showInventoryItems(_ items: [InventoryItem])
    func setCreateAllowed(_ allowed: Bool)
    
}
