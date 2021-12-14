//
//  NetworkingService.swift
//  NASA_MediaSearchApp
//
//  Created by zeus on 2021-12-08.
//  Copyright © 2021 zeus. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON


class NetworkingService {
    
    static let shared = NetworkingService()
    
    public var searchedObject = [MediaItem]()
    
    
    private init() {}
  
      private func parseJSON(json: JSON) -> MediaItem {
          let title = json["collection"]["items"]["data"][0]["title"].stringValue
          let description = json["collection"]["items"]["data"][0]["description"].stringValue
          let imageLink = json["collection"]["items"]["links"][0]["href"].stringValue
          let dateCreated = json["collection"]["items"]["data"][0]["date_created"].stringValue
    
          return MediaItem(title: title, description: description, imageLink: imageLink, dateCreated: dateCreated)
      }

    
 
    
    func getData(completion: ()-> Void) {
        
        AF.request("https://images-api.nasa.gov/search?q=mars&media_type=image", method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
            
                do {
                let data = try JSON(data: response.data!)
//     let mediaObject = self.parseJSON(json: data)
//      completion(mediaObject)
        let resultArray = data["collection"]["items"].arrayValue

        for item in resultArray {
            
                let title = item["data"][0]["title"].stringValue
                let description = item["data"][0]["description"].stringValue
                let imageLink = item["links"][0]["href"].stringValue
            let imageDate = item["data"][0]["date_created"].stringValue

            self.searchedObject.append(MediaItem(title: title, description: description, imageLink: imageLink, dateCreated: imageDate))

            print(self.searchedObject)

                }
            
                } catch {
    }
                break
            case .failure: print(NetworkingError.networkIssue)

            break
              
                
                
            }
        }
            
    }
        

    
/// Closing Class bracket
        }
        
    

        


