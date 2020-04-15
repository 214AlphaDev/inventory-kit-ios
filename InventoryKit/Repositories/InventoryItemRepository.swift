//
//  InventoryItemRepository.swift
//  InventoryKit
//
//  Created by Florian on 13.05.19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import RealmSwift

class InventoryItemModel : Object {
    
    @objc dynamic var id : String = ""
    @objc dynamic var desc : String = ""
    @objc dynamic var voted : Bool = false
    @objc dynamic var votes : Int = 0
    @objc dynamic var name : String = ""
    @objc dynamic var story : String?
    @objc dynamic var photoString : String?
    @objc dynamic var category : String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}

func mapInventoryItemModelToEntity(item: InventoryItemModel) throws -> InventoryItem {
    return InventoryItem(id: try UUIDV4(item.id), name: item.name, description: item.desc, story: item.story, photo: try ItemPhoto.from(dataString: item.photoString), votes: item.votes, isVoted: item.voted, category: InventoryCategory(stringIdentifier: item.category))
}

public class InventoryItemRepository: InventoryItemRepositoryProtocol {
    
    let db : Realm
    
    public init(db: Realm) {
        self.db = db
    }
    
    public func persist(item: InventoryItem) throws {
        
        // map entity to model
        let model = InventoryItemModel()
        model.id = item.id.description
        model.desc = item.description
        model.voted = item.isVoted
        model.votes = item.votes
        model.name = item.name
        model.story = item.story
        model.photoString = item.photo?.pictureDataString
        model.category = item.category.stringIdentifier
        
        // persist model
        try self.db.write {
            self.db.add(model, update: true)
        }
    }
    
    public func get(id: UUIDV4) throws -> InventoryItem? {
        guard let item = db.object(ofType: InventoryItemModel.self, forPrimaryKey: id.description) else {
            return nil
        }
        
        return try mapInventoryItemModelToEntity(item: item)
        
    }
    
    public func getAll() throws -> [InventoryItem] {
        let models = self.db.objects(InventoryItemModel.self)
        
        return try models.map(mapInventoryItemModelToEntity)
    }
    
    public func get(fromId: UUIDV4?, count: Int) throws -> [InventoryItem] {
        
        let items = self.db.objects(InventoryItemModel.self)
        let countToGet = min(items.count, count)
        
        var entities = [InventoryItem]()
        for i in 0..<countToGet {
            entities.append(try mapInventoryItemModelToEntity(item: items[i]))
        }
        
        return entities
    }
    
    public func delete(id: UUIDV4) throws {
        guard let itemToDelete = db.object(ofType: InventoryItemModel.self, forPrimaryKey: id.description) else {
            return 
        }
        
        try db.write {
            db.delete(itemToDelete)
        }
    }
    
    public func deleteAll() throws {
        try db.write {
            db.deleteAll()
        }
    }
    
}

extension InventoryCategory {
    
    init(stringIdentifier: String) {
        switch stringIdentifier {
        case "book":
            self.init(kind: .book)
        case "seed":
            self.init(kind: .seed)
        default:
            self.init(kind: .other)
        }
    }
    
    var stringIdentifier: String {
        switch self.kind {
        case .book:
            return "book"
        case .seed:
            return "seed"
        case .other:
            return "other"
        }
    }
    
}
