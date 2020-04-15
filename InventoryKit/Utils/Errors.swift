//
//  Errors.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

protocol IntentoryKitError: Error {
    var errorDescription: String { get }
}

enum ValidationError: IntentoryKitError {
    case invalidUUIDV4String
    case invalidItemPhoto
    case invalidItemPhotoPictureData
    case invalidEmptyInventoryItemName
    case invalidTooSmallInventoryItemDescription
    case invalidTooSmallInventoryItemStory
    
    var errorDescription: String {
        switch self {
        case .invalidUUIDV4String:
            return "Provided uuidv4 string is invalid"
        case .invalidItemPhoto:
            return "Provided picture is invalid"
        case .invalidItemPhotoPictureData:
            return "Provided picture data is invalid"
        case .invalidEmptyInventoryItemName:
            return "Inventory item should have non-empty name"
        case .invalidTooSmallInventoryItemDescription:
            return "Inventory item description should be at least 30 characters"
        case .invalidTooSmallInventoryItemStory:
            return "Inventory item story should be at least 20 characters or empty"
        }
    }
}

enum ResponseError: IntentoryKitError {
    
    case requestFailed(serverErrorMessage: String)
    case missingResponseAndError
    case unknownError
    case unauthenticated
    case unauthorized
    case itemDoesNotExist
    
    var errorDescription: String {
        switch self {
        case .requestFailed(let message):
            return "Request failed with error message: \(message)"
        case .missingResponseAndError:
            return "Server responded without any response or error. Please report this issue"
        case .unknownError:
            return "Something went wrong"
        case .unauthenticated:
            return "Not authenticated"
        case .itemDoesNotExist:
            return "Requested item does not exist"
        case .unauthorized:
            return "You're not authorized to do that"
        }
    }
    
}

enum PersistenceError: IntentoryKitError {
    
    case inventoryItemPersistenceFailed(underlyingError: Error)
    
    var errorDescription: String {
        switch self {
        case .inventoryItemPersistenceFailed(let underlyingError):
            return "Failed to persist inventory item with underlying error \(ErrorDescription.describe(error: underlyingError) ?? underlyingError.localizedDescription)"
        }
    }
    
    
}
