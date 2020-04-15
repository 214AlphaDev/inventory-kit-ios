//
//  Response.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public enum Response<T> {
    case failure(Error)
    case success(T)
}
