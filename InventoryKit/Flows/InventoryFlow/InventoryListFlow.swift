//
//  InventoryListFlow.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol InventoryListFlowProtocol: Flow {}

public struct InventoryListFlowFactory {
    
    public static func build(
        navigationController: UINavigationController,
        inventoryListPresenter: InventoryListPresenterProtocol,
        inventoryItemDetailsFlowFactory: @escaping (InventoryItem) -> InventoryItemDetailsFlowProtocol,
        inventoryItemCreateFlow: InventoryItemCreateFlowProtocol) -> InventoryListFlowProtocol {
        let builder = FlowBuilder(rootFlow: InventoryListFlow(navigationController: navigationController, inventoryListPresenter: inventoryListPresenter))
        
        return builder
            .push(on: DisplayInventoryItemDetailsScreenAction.self) { _, action in
                return inventoryItemDetailsFlowFactory(action.item)
            }
            .on(DisplayInventoryItemCreateScreenAction.self) { flow, _ in
                try flow.present(inventoryItemCreateFlow, animated: true)
            }
            .on(CloseInventoryItemDetailsScreenAction.self) { root, _ in
                inventoryListPresenter.reloadInventoryItems()
                root.popFlow(animated: true)
            }
            .on(CloseInventoryItemCreateScreenAction.self) { root, _ in
                inventoryListPresenter.reloadInventoryItems()
                root.dismissPresenterFlow(animated: true)
            }
            .rootFlow
    }
    
}

public class InventoryListFlow: PushPopNavigationFlow, InventoryListFlowProtocol, InventoryListPresenterDelegate {
    
    init(navigationController: UINavigationController, inventoryListPresenter: InventoryListPresenterProtocol) {
        super.init(navigationController: navigationController, rootFlow: SingleScreenFlow(presenter: inventoryListPresenter))
        
        inventoryListPresenter.delegate = WeakWrapper(self)
    }
    
    // MARK: InventoryListPresenterDelegate
    
    public func presenterRequestNavigateToCreateInventoryItemScreen(_ presenter: InventoryListPresenterProtocol) throws {
        try handle(action: DisplayInventoryItemCreateScreenAction())
    }
    
    public func presenter(_ presenter: InventoryListPresenterProtocol, requestNavigateToInventoryItemDetailsScreenWith item: InventoryItem) throws {
        try handle(action: DisplayInventoryItemDetailsScreenAction(item: item))
    }
    
}
