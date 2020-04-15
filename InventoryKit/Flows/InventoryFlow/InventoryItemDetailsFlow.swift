//
//  InventoryDetailsFlow.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/10/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol InventoryItemDetailsFlowProtocol: Flow {}

public struct InventoryItemDetailsFlowFactory {
    
    public static func build(
        inventoryItemDetailsPresenterFactory: (InventoryItem) -> InventoryItemDetailsPresenterProtocol,
        item: InventoryItem,
        inventoryItemEditFlowFactory: @escaping (InventoryItem) -> InventoryItemEditFlowProtocol) -> InventoryItemDetailsFlowProtocol {
        let builder = FlowBuilder(rootFlow: InventoryItemDetailsFlow(inventoryItemDetailsPresenter: inventoryItemDetailsPresenterFactory(item)))
        
        return builder.on(DisplayInventoryItemEditScreenAction.self) { flow, action in
            try flow.present(inventoryItemEditFlowFactory(action.item), animated: true)
            }
            .on(CloseInventoryItemEditScreenAction.self) { flow, action in
                flow.presenter.update(with: action.updatedItem)
                flow.dismissPresenterFlow(animated: true)
        }.rootFlow
    }
    
}

public class InventoryItemDetailsFlow: SingleScreenFlow, InventoryItemDetailsFlowProtocol, InventoryItemDetailsPresenterDelegate {
    
    var presenter: InventoryItemDetailsPresenterProtocol {
        return basePresenter as! InventoryItemDetailsPresenterProtocol
    }
    
    init(inventoryItemDetailsPresenter: InventoryItemDetailsPresenterProtocol) {
        super.init(presenter: inventoryItemDetailsPresenter)
        
        inventoryItemDetailsPresenter.delegate = WeakWrapper(self)
    }
 
    public func presenterRequestNavigateToInventoryListScreen(_ presenter: InventoryItemDetailsPresenterProtocol) throws {
        try handle(action: CloseInventoryItemDetailsScreenAction())
    }
    
    public func presenter(_ presenter: InventoryItemDetailsPresenterProtocol, requestsNavigateToInventoryItemEditScreenWith item: InventoryItem) throws {
        try handle(action: DisplayInventoryItemEditScreenAction(item: item))
    }
    
}
