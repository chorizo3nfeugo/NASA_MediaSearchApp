//
//  CollectionViewCell.swift
//  NASA_MediaSearchApp
//
//  Created by zeus on 2021-12-08.
//  Copyright © 2021 zeus. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class CollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var imageInCell: UIImageView!
    
    
    @IBOutlet weak var imageDetailLabel: UILabel!
    
    
    
    
    
    func setupArrayToCells(){
        
/// To DO :  Need to create a loop to have each cell populate image
        
        let url = "https://images-assets.nasa.gov/image/PIA08789/PIA08789~small.jpg"
       
        AF.request(url).responseImage { response  in
            if let image = response.value {
                
                DispatchQueue.main.async {
                    let radius: CGFloat = 15.0
                    self.imageInCell?.image = image.af.imageRounded(withCornerRadius: radius)
                }
           print("\(image)")
           
            }
        }
    //    imageInCell.image = "JSON ARRAY IMAGE LOCATION   "
   //     imageDetailLabel.text = " JSON ARRAY DETAILS    "
    }
    
}
