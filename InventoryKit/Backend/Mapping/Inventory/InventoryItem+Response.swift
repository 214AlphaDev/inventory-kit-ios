//
//  InventoryItem+Response.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

extension InventoryItem {
    
    init(output: API.InventoryItemsQuery.Data.Item) throws {
        self = InventoryItem(id: try UUIDV4(output.id), name: output.name, description: output.description, story: output.story, photo: try ItemPhoto.from(dataString: output.photo), votes: output.votes, isVoted: output.votedOnIt, category: .init(apiCategory: output.category))
    }
    
    init(output: API.VoteForInventoryItemMutation.Data.Vote.Item) throws {
        self = InventoryItem(id: try UUIDV4(output.id), name: output.name, description: output.description, story: output.story, photo: try ItemPhoto.from(dataString: output.photo), votes: output.votes, isVoted: output.votedOnIt, category: .init(apiCategory: output.category))
    }
    
    init(output: API.WithdrawVoteFromInventoryItemMutation.Data.WithdrawVote.Item) throws {
        self = InventoryItem(id: try UUIDV4(output.id), name: output.name, description: output.description, story: output.story, photo: try ItemPhoto.from(dataString: output.photo), votes: output.votes, isVoted: output.votedOnIt, category: .init(apiCategory: output.category))
    }
    
    init(output: API.CreateInventoryItemMutation.Data.Create.Item) throws {
        self = InventoryItem(id: try UUIDV4(output.id), name: output.name, description: output.description, story: output.story, photo: try ItemPhoto.from(dataString: output.photo), votes: output.votes, isVoted: output.votedOnIt, category: .init(apiCategory: output.category))
    }
    
    init(output: API.EditInventoryItemMutation.Data.UpdateItem.Item) throws {
        self = InventoryItem(id: try UUIDV4(output.id), name: output.name, description: output.description, story: output.story, photo: try ItemPhoto.from(dataString: output.photo), votes: output.votes, isVoted: output.votedOnIt, category: .init(apiCategory: output.category))
    }
    
}
