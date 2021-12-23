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
    public init() {}


   public var parsedMediaObjects: [MediaItem] = []
    



// MARK: -                                                                                Get Data!
    func getData(query: String){

        let urlString = query
        
        let urlEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
        
          let url = "https://images-api.nasa.gov/search?q=\(urlEncoded!)&media_type=image"

        AF.request(url, method: .get).responseJSON { response in

           switch response.result {
            case .success(let value):
                
             //   self.parsedMediaObjects = []
                
                let json = JSON(value)
                
                 let collection = json["collection"]["items"].arrayValue
                    
                    for item in collection {
                    
                                        let title = item["data"][0]["title"].stringValue
                                        let  description = item["data"][0]["description"].stringValue
                                        let imageLink =  item["links"][0]["href"].stringValue
                                        let dateCreated =  item["data"][0]["date_created"].stringValue
                    
                                        self.parsedMediaObjects.append(MediaItem(title: title, description: description, imageLink: imageLink, dateCreated: dateCreated))
                     print("Here be the RAW JSON Items: \(self.parsedMediaObjects.count)")
                     
                                    }
              
             //   print("Here be a RAW JSON: \(item)")
            
            case .failure(let error):
                print("Here is an NASA-JSON Error!: \(error)")
            }
            
        }
        
    }

/// Closing Class bracket

}
    

        


