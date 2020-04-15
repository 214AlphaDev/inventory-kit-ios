//
//  ErrorDescription.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public struct ErrorDescription {
    
    public static func describe(error: Error) -> String? {
        guard let inventoryKitError = error as? IntentoryKitError else {
            return nil
        }
        
        return inventoryKitError.errorDescription
    }
    
}
