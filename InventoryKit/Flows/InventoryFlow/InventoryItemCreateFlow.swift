//
//  InventoryItemCreateFlow.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol InventoryItemCreateFlowProtocol: Flow {}

public struct InventoryItemCreateFlowFactory {
    
    public static func build(inventoryItemCreatePresenter: InventoryItemCreatePresenterProtocol) -> InventoryItemCreateFlowProtocol {
        
        return InventoryItemCreateFlow(inventoryItemCreatePresenter: inventoryItemCreatePresenter)
    }
    
}

class InventoryItemCreateFlow: SingleScreenFlow, InventoryItemCreateFlowProtocol, InventoryItemCreatePresenterDelegate {
    
    init(inventoryItemCreatePresenter: InventoryItemCreatePresenterProtocol) {
        super.init(presenter: inventoryItemCreatePresenter)
        
        inventoryItemCreatePresenter.delegate = WeakWrapper(self)
    }
    
    // MARK: InventoryItemCreatePresenterDelegate
    
    func presenterRequestNavigateToInventoryListScreen(_ presenter: InventoryItemCreatePresenterProtocol) throws {
        try handle(action: CloseInventoryItemCreateScreenAction())
    }
    
    
}
