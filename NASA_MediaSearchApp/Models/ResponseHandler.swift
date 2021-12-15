//
//  ResponseHandler.swift
//  NASA_MediaSearchApp
//
//  Created by zeus on 2021-12-10.
//  Copyright © 2021 zeus. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

struct ResponseHandle {
    
    let pulledItems: [MediaItem]
    
 
    init(json: JSON) throws {
        
// Root response of API is called "collection"
        guard let collection = json["collection"].arrayObject else { throw NetworkingError.networkIssue }
        let item = collection.map{ MediaItem(json: $0 as! JSON)}.compactMap{ $0 }
        self.pulledItems = item
    }
}


