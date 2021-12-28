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

    public var parsedMediaObjects = [MediaItem]()
    
    var nextURLPage:String = ""
    var isPaginating = false
    
// MARK: -                                                                                          Get Inital DATA
    func getData(query: String, completion: @escaping ([MediaItem]) -> Void) {
        
        let urlString = query
        let urlEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
        let url = "https://images-api.nasa.gov/search?q=\(urlEncoded!)&media_type=image"
        
        AF.request(url, method: .get).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                
                self.parsedMediaObjects = []
                
                let dispatchTime = DispatchTime.now() + 4
                
                DispatchQueue.global(qos: .background).asyncAfter(deadline: dispatchTime) {
                    
                    
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
                    self.nextURLPage = json["collection"]["links"][0]["href"].stringValue
                    DispatchQueue.main.async {
                        completion(self.parsedMediaObjects)
                    }
                }
            case .failure(let error):
                print("Here is an NASA-JSON Error!: \(error)")
                completion(self.parsedMediaObjects)
            }
        }
        
    }

// MARK: -                                                                                              Get More DATA via Pagination Bool
    
    func fetchMorePages(pagination: Bool, completion: @escaping ([MediaItem]) -> Void) {
        
        if pagination {
            isPaginating = true
        }
        AF.request(nextURLPage, method: .get).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                
/// Adding 4 sec  for it if pagination is already in progress here.
                
                let dispatchTime = DispatchTime.now() + (pagination ? 4 : 1)
                
                DispatchQueue.global(qos: .background).asyncAfter(deadline: dispatchTime, execute: {
                    
                    let json = JSON(value)
                    self.nextURLPage = json["collection"]["links"][0]["href"].stringValue
                    
                    let collection = json["collection"]["items"].arrayValue
                    
                    for item in collection {
                        
                        let title = item["data"][0]["title"].stringValue
                        let  description = item["data"][0]["description"].stringValue
                        let imageLink =  item["links"][0]["href"].stringValue
                        let dateCreated =  item["data"][0]["date_created"].stringValue
                        
                        self.parsedMediaObjects.append(MediaItem(title: title, description: description, imageLink: imageLink, dateCreated: dateCreated))
                        print("Here be the RAW JSON Items: \(self.parsedMediaObjects.count)")
                        
                    }
                    DispatchQueue.main.async {
                        completion(self.parsedMediaObjects)
                        if pagination  {
                            self.isPaginating = false
                        }
                    }
                    
                })
                
            case .failure(let error):
                
                if pagination {
                    self.isPaginating = false
                }
                
                print("Here is an JSON Error!: \(error)")
                completion(self.parsedMediaObjects)
            }
        }
    }

}
    

        


