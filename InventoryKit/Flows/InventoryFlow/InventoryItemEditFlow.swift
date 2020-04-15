//
//  InventoryItemEditFlow.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/27/19.
//  Copyright © 2019 214Alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol InventoryItemEditFlowProtocol: Flow {}

public struct InventoryItemEditFlowFactory {
    
    public static func build(
        inventoryItemEditPresenterFactory: (InventoryItem) -> InventoryItemEditPresenterProtocol,
        item: InventoryItem) -> InventoryItemEditFlowProtocol {
        return InventoryItemEditFlow(inventoryItemEditPresenter: inventoryItemEditPresenterFactory(item))
    }

}

class InventoryItemEditFlow: SingleScreenFlow, InventoryItemEditFlowProtocol, InventoryItemEditPresenterDelegate {
    
    init(inventoryItemEditPresenter: InventoryItemEditPresenterProtocol) {
        super.init(presenter: inventoryItemEditPresenter)
        
        inventoryItemEditPresenter.delegate = WeakWrapper(self)
    }
    
    // MARK: InventoryItemEditPresenterDelegate
    
    func presenter(_ presenter: InventoryItemEditPresenterProtocol, requestNavigateBackWith updatedItem: InventoryItem) throws {
        try handle(action: CloseInventoryItemEditScreenAction(updatedItem: updatedItem))
    }
    
}
