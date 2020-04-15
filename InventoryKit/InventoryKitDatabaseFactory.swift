//
//  InventoryKitDatabaseFactory.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import RealmSwift

public struct InventoryKitDatabaseFactory {
    
    public static func buildDatabase(subjectId: String) throws -> Realm {
        var config = Realm.Configuration.defaultConfiguration
        
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(subjectId)_inventorykit")
        
        config.schemaVersion = 1
        config.migrationBlock = { migration, oldSchemaVersion in
            if oldSchemaVersion < 1 {
                // Realm updates everything automatically
            }
        }
        
        return try Realm(configuration: config)
    }
    
}
