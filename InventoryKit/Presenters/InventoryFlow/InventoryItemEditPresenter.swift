//
//  InventoryItemEditPresenter.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/27/19.
//  Copyright © 2019 214Alpha. All rights reserved.
//

import Foundation
import FlowKit

public class InventoryItemEditPresenter: InventoryItemEditPresenterProtocol {
    
    public var delegate: WeakWrapper<InventoryItemEditPresenterDelegate> = WeakWrapper()
    public let view: InventoryItemEditViewProtocol
    private let originalItem: InventoryItem
    private var modifiedItem: CreatingInventoryItem
    private let inventoryService: InventoryServiceProtocol
    
    public init(view: InventoryItemEditViewProtocol, inventoryService: InventoryServiceProtocol, inventoryItem: InventoryItem) {
        self.view = view
        self.inventoryService = inventoryService
        self.originalItem = inventoryItem
        self.modifiedItem = CreatingInventoryItem(inventoryItem: inventoryItem)
        
        view.presenter = WeakWrapper(self)
        
        view.setInventoryItem(inventoryItem)
    }
    
    public func setName(_ name: String) {
        self.modifiedItem.name = name
    }
    
    public func setDescription(_ description: String) {
        self.modifiedItem.description = description
    }
    
    public func setStory(_ story: String?) {
        self.modifiedItem.story = story
    }
    
    public func setItemPhoto(_ image: UIImage?) {
        guard let image = image else {
            self.modifiedItem.photo = nil
            return
        }
        
        do {
            self.modifiedItem.photo = try ItemPhoto(image)
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }
    
    public func setCategory(_ category: InventoryCategory) {
        self.modifiedItem.category = category
    }
    
    public func submit() {
        view.setLoadingIndicatorVisible(true)
        inventoryService.editInventoryItem(with: originalItem.id, modifiedItem: modifiedItem) { [weak self] response in
            guard let self = self else { return }
            
            do {
                switch response {
                case .failure(let error):
                    throw error
                case .success(let updatedItem):
                    self.view.setLoadingIndicatorVisible(false)
                    try self.delegate.wrapped?.presenter(self, requestNavigateBackWith: updatedItem)
                }
            } catch {
                self.view.setLoadingIndicatorVisible(false)
                self.view.displayError(title: "Error", error: error)
            }
        }
    }
    
    public func cancel() {
        do {
            try delegate.wrapped?.presenter(self, requestNavigateBackWith: self.originalItem)
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }
    
    // MARK: Validation
    
    public func validate(field: InventoryItemEditValidationField) -> ValidationResult {
        switch field {
        case .description(let description):
            return description.count < 30 ? .invalid(ValidationError.invalidTooSmallInventoryItemDescription) : .valid
        case .name(let name):
            return name.count < 5 ? .invalid(ValidationError.invalidEmptyInventoryItemName) : .valid
        case .story(let story):
            if let story = story {
                return story.count < 20 ? .invalid(ValidationError.invalidTooSmallInventoryItemStory) : .valid
            }
            
            return .valid
        }
    }
    
    // MARK: ViewControllerProvider
    
    public var viewController: UIViewController {
        return view.viewController
    }
    
}
