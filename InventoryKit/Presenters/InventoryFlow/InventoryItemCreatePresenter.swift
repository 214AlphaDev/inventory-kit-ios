//
//  InventoryItemCreatePresenter.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public class InventoryItemCreatePresenter: InventoryItemCreatePresenterProtocol {
    
    public var delegate: WeakWrapper<InventoryItemCreatePresenterDelegate> = WeakWrapper()
    public let view: InventoryItemCreateViewProtocol
    private var creatingItem: CreatingInventoryItem = CreatingInventoryItem()
    private let inventoryService: InventoryServiceProtocol
    
    public init(view: InventoryItemCreateViewProtocol, inventoryService: InventoryServiceProtocol, draft: CreatingInventoryItem? = nil) {
        self.view = view
        self.inventoryService = inventoryService
        view.presenter = WeakWrapper(self)
        
        if let draft = draft {
            self.creatingItem = draft
        }
    }
    
    public func setName(_ name: String) {
        self.creatingItem.name = name
    }
    
    public func setDescription(_ description: String) {
        self.creatingItem.description = description
    }
    
    public func setStory(_ story: String?) {
        self.creatingItem.story = story
    }
    
    public func setItemPhoto(_ image: UIImage?) {
        guard let image = image else {
            self.creatingItem.photo = nil
            return
        }
        
        do {
            self.creatingItem.photo = try ItemPhoto(image)
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }
    
    public func setCategory(_ category: InventoryCategory) {
        self.creatingItem.category = category
    }
    
    public func submit() {
        view.setLoadingIndicatorVisible(true)
        inventoryService.createInventoryItem(creatingItem) { [weak self] response in
            guard let self = self else { return }
            
            do {
                switch response {
                case .failure(let error):
                    throw error
                case .success(_):
                    self.view.setLoadingIndicatorVisible(false)
                    try self.delegate.wrapped?.presenterRequestNavigateToInventoryListScreen(self)
                    self.clear()
                }
            } catch {
                self.view.setLoadingIndicatorVisible(false)
                self.view.displayError(title: "Error", error: error)
            }
        }
    }
    
    public func cancel() {
        do {
            try delegate.wrapped?.presenterRequestNavigateToInventoryListScreen(self)
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }
    
    public func clear() {
        self.creatingItem = CreatingInventoryItem()
        self.view.setDraft(creatingItem)
    }
    
    // MARK: Validation
    
    public func validate(field: InventoryItemCreateValidationField) -> ValidationResult {
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
