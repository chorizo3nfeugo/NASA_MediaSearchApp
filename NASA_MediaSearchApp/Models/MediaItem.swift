//
//  MediaObjects.swift
//  NASA_MediaSearchApp
//
//  Created by zeus on 2021-12-10.
//  Copyright © 2021 zeus. All rights reserved.
//

import Foundation
import SwiftyJSON




struct MediaItem {
   
    var title:String?
    var description:String?
    var imageLink:String?
    var dateCreated:String?
    
    
    init(title: String , description: String, imageLink: String, dateCreated:String){
        self.title = title
        self.description = description
        self.imageLink = imageLink
        self.dateCreated = dateCreated
    }
    
}

struct MediaItemLinks {
    var moreLinks:String?
    
    init(moreLinks: String){
        self.moreLinks = moreLinks
    }
    
    
}
    






