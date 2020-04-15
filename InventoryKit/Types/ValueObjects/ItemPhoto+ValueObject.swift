//
//  ItemPhoto+ValueObject.swift
//  InventoryKit
//
//  Created by Andrii Selivanov on 5/24/19.
//  Copyright © 2019 214Alpha. All rights reserved.
//

import Foundation
import UIKit

public struct ItemPhoto {
    
    public let picture: UIImage
    public let pictureDataString: String
    public init(_ picture: UIImage) throws {
        self.picture = picture
        
        guard let data = picture.jpegData(compressionQuality: 0.8) else {
            throw ValidationError.invalidItemPhoto
        }
        
        self.pictureDataString = data.base64EncodedString(options: .lineLength64Characters)
    }
    
    public init(_ pictureData: String) throws {
        guard let data = Data(base64Encoded: pictureData), let image = UIImage(data: data) else {
            throw ValidationError.invalidItemPhotoPictureData
        }
        
        self.picture = image
        self.pictureDataString = pictureData
    }
    
    public static func from(dataString: String?) throws -> ItemPhoto? {
        if let photoData = dataString {
            return try ItemPhoto(photoData)
        }
    
        return nil
    }
    
}
