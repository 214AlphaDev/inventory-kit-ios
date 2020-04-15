//
//  Errors+InventoryList.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

extension ResponseError {
    
    init(voteError: API.VoteError) {
        switch voteError {
        case .unauthenticated:
            self = .unauthenticated
        case .itemDoesNotExist:
            self = .itemDoesNotExist
        case .__unknown(_):
            self = .unknownError
        }
    }
    
    init(withdrawVoteError: API.WithdrawVoteError) {
        switch withdrawVoteError {
        case .unauthenticated:
            self = .unauthenticated
        case .itemDoesNotExist:
            self = .itemDoesNotExist
        case .__unknown(_):
            self = .unknownError
        }
    }
    
    init(createItemError: API.CreateItemError) {
        switch createItemError {
        case .unauthenticated:
            self = .unauthenticated
        case .unauthorized:
            self = .unauthorized
        case .__unknown(_):
            self = .unknownError
        }
    }
    
    init(updateItemError: API.UpdateItemError) {
        switch updateItemError {
        case .unauthenticated:
            self = .unauthenticated
        case .itemDoesNotExist:
            self = .itemDoesNotExist
        case .unauthorized:
            self = .unauthorized
        case .__unknown(_):
            self = .unknownError
        }
    }
    
    init(deleteItemError: API.DeleteItemError) {
        switch deleteItemError {
        case .unauthenticated:
            self = .unauthenticated
        case .itemDoesNotExist:
            self = .itemDoesNotExist
        case .unauthorized:
            self = .unauthorized
        case .__unknown(_):
            self = .unknownError
        }
    }
    
}
