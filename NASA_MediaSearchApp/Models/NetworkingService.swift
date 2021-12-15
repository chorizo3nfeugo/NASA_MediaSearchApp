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

 // MARK: - paarsing json func ?
  //  public var searchedObject = [MediaItem]()
//      private func parse(json: JSON) -> MediaItem {
//          let title = json["collection"]["items"]["data"][0]["title"].stringValue
//          let description = json["collection"]["items"]["data"][0]["description"].stringValue
//          let imageLink = json["collection"]["items"]["links"][0]["href"].stringValue
//          let dateCreated = json["collection"]["items"]["data"][0]["date_created"].stringValue
//
//          return MediaItem(title: title, description: description, imageLink: imageLink, dateCreated: dateCreated)
//      }

// MARK: - URL Link testing
//  public var fromUserInputValue = "Mars"
//  let urlString  = "moon"
//  let inputQueryString = self.urlString
//  let urlEncoded = inputQueryString.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
//  let url2 = "https://images-api.nasa.gov/search?q=\(urlEncoded!)&media_type=image"

    
    
  // MARK: - Get Data!
    func getData(success successBlock: @escaping (ResponseHandle)-> Void) {

        let url = "https://images-api.nasa.gov/search?q=mars&media_type=image"
        AF.request(url, method: .get).responseJSON { response in
            
            guard let json = response.value as? JSON else {return}
            do{
            let getResponse = try ResponseHandle(json: json)
            successBlock(getResponse)
            }catch{
// Need to put in Error handling here
                }
            }
        }

// MARK: -      testing Func for Data
    
//    var emptyData2 = [MediaItem]()
//    func getData2(){
//        AF.request("https://images-api.nasa.gov/search?q=mars&media_type=image",method: .get).responseJSON { response in
//            switch response.result {
//            case .success:
//                do {
//                    let data = try JSON(data: response.data!)
//                    let collectionArray = data["collection"].arrayValue
//                    for item in collectionArray {
//
//                        self.emptyData2.append(MediaItem(json: item)!)
//
//                    }
//                    print(self.emptyData2)
//                } catch {
//
//                }
//
//
//                print(response)
//            case .failure: print("Ah No stuff came back!")
//            }
//
//        }
//    }
    
/// Closing Class bracket
    
        }


    

        


