//
//  InventoryItemEdit+MVP.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/27/19.
//  Copyright © 2019 214Alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol InventoryItemEditPresenterDelegate: class {
    
    func presenter(_ presenter: InventoryItemEditPresenterProtocol, requestNavigateBackWith updatedItem: InventoryItem) throws
    
}

public enum InventoryItemEditValidationField {
    case name(String)
    case description(String)
    case story(String?)
}

public protocol InventoryItemEditPresenterProtocol: Presenter {
    
    var delegate: WeakWrapper<InventoryItemEditPresenterDelegate> { get set }
    var view: InventoryItemEditViewProtocol { get }
    
    func setName(_ name: String)
    func setDescription(_ description: String)
    func setStory(_ story: String?)
    func setItemPhoto(_ image: UIImage?)
    func setCategory(_ category: InventoryCategory)
    func validate(field: InventoryItemEditValidationField) -> ValidationResult
    func submit()
    func cancel()
    
}

public protocol InventoryItemEditViewProtocol: class, ViewControllerProvider, ErrorDisplayable, LoadingIndicatorDisplayable {
    
    var presenter: WeakWrapper<InventoryItemEditPresenterProtocol> { get set }
    
    func setInventoryItem(_ item: InventoryItem)
    
}
