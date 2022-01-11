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
    
    
// MARK: -                                                                      ViewDidLoad
        
        override func layoutSubviews() {
            super.layoutSubviews()
        }
        
// MARK: -                                                                      Prepares cells for reuse
        override func prepareForReuse() {
            super.prepareForReuse()
            
            imageInCell.image = nil
            imageDetailLabel.text = nil
            
        }
        
  
    let imageCache = AutoPurgingImageCache(
        memoryCapacity: 100_000_000,
        preferredMemoryUsageAfterPurge: 60_000_000
    )
    
//    let nasaImage = UIImage(data: data)!
    
// MARK: -                                                                      Configures cells with image and title
    func configureCells(imageName:String, url: String){
        
        imageDetailLabel.text = imageName
       // self.imageInCell = nil
        
       
    
        
        let urlRequest = URLRequest(url: (URL(string: url)!))
        
        
                
    
        
        if let imageFromCache = imageCache.image(for: urlRequest, withIdentifier: "firstPull") {
            self.imageInCell?.image = imageFromCache
            return
        }
        
        
        AF.request(url).responseImage { response  in
            if let image = response.value {
                
                let size = CGSize(width: 150.0, height: 190.0)
               // let size = CGSize(width:(self.frame.size.width/3)-3,height: (self.frame.size.width/3)-3)
                
              //  image.af.inflate()
                
                DispatchQueue.main.async {
                    let radius: CGFloat = 15.0
                    image.af.inflate()
                    
                    self.imageCache.add(image, for: urlRequest, withIdentifier: "firstPull")
                    self.imageInCell?.image = image.af.imageRounded(withCornerRadius: radius)
                    self.imageInCell?.image = image.af.imageAspectScaled(toFill: size)
                    
                    //  self.imageInCell?.image = image.af.imageScaled(to: size)
                    //  self.imageInCell?.image = image.af.imageAspectScaled(toFit: size)
//                    let imageToCache = UIImage(data: data)!
//
//                    imageCache.add(imageToCache, withIdentifier: "\(url)")
                    
                }
            }
        }
        
        
    
    }
}
