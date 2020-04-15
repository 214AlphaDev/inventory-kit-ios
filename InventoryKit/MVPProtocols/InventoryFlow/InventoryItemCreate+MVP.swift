//
//  InventoryItemCreate+MVP.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol InventoryItemCreatePresenterDelegate: class {
    
    func presenterRequestNavigateToInventoryListScreen(_ presenter: InventoryItemCreatePresenterProtocol) throws
    
}

public enum InventoryItemCreateValidationField {
    case name(String)
    case description(String)
    case story(String?)
}

public protocol InventoryItemCreatePresenterProtocol: Presenter {
    
    var delegate: WeakWrapper<InventoryItemCreatePresenterDelegate> { get set }
    var view: InventoryItemCreateViewProtocol { get }
    
    func setName(_ name: String)
    func setDescription(_ description: String)
    func setStory(_ story: String?)
    func setItemPhoto(_ image: UIImage?)
    func setCategory(_ category: InventoryCategory)
    func validate(field: InventoryItemCreateValidationField) -> ValidationResult
    func submit()
    func cancel()
    func clear()
    
}

public protocol InventoryItemCreateViewProtocol: class, ViewControllerProvider, ErrorDisplayable, LoadingIndicatorDisplayable {
    
    var presenter: WeakWrapper<InventoryItemCreatePresenterProtocol> { get set }
    
    func setDraft(_ draft: CreatingInventoryItem)
    
}
