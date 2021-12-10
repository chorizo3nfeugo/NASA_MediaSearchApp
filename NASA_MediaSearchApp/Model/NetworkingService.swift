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
    
    private init() {}
  
    typealias JSON  = [String: Any]
    
    
    // Name of image would be     "items/0/title"
    // Where path is located is     "items/0/href"
    
    func getData(completion: ()-> Void) {
       
                
        AF.request("https://images-api.nasa.gov/search?q=mars&media_type=image").responseJSON { response in
            if let json = response.value as? JSON {
                print(json)
             
            }
        }
        
    }
        

}
