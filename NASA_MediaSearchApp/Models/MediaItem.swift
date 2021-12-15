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
   
       let title:           String
       let description:      String
       let imageLink:       String
       let dateCreated:     String

    init?(json: JSON){
       guard let title = json["items"]["data"][0]["title"].string,
        let description = json["items"]["data"][0]["description"].string,
        let imageLink = json["items"]["links"][0]["href"].string,
        let dateCreated = json["items"]["data"][0]["date_created"].string
        else { return nil }
            
        self.title = title
        self.description = description
        self.imageLink =  imageLink
        self.dateCreated =  dateCreated
 
    }
               
    
    
}
