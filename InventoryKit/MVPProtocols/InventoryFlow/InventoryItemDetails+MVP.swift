//
//  InventoryItemDetails+MVP.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol InventoryItemDetailsPresenterDelegate: class {
    
    func presenterRequestNavigateToInventoryListScreen(_ presenter: InventoryItemDetailsPresenterProtocol) throws
    func presenter(_ presenter: InventoryItemDetailsPresenterProtocol, requestsNavigateToInventoryItemEditScreenWith item: InventoryItem) throws
    
}

public protocol InventoryItemDetailsPresenterProtocol: Presenter {
    
    var delegate: WeakWrapper<InventoryItemDetailsPresenterDelegate> { get set }
    var view: InventoryItemDetailsViewProtocol { get }
    
    func vote()
    func withdrawVote()
    func delete()
    func edit()
    func update(with item: InventoryItem)
    
}

public protocol InventoryItemDetailsViewProtocol: class, ViewControllerProvider, ErrorDisplayable, LoadingIndicatorDisplayable {
    
    var presenter: WeakWrapper<InventoryItemDetailsPresenterProtocol> { get set }
    
    func displayInventoryItem(_ item: InventoryItem)
    func setDeleteAllowed(_ allowed: Bool)
    func setEditAllowed(_ allowed: Bool)

}
