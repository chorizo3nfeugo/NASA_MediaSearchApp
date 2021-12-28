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
        
// MARK: -                                                                      Configures cells with image and title
    func configureCells(imageName:String, url: String){
        
        imageDetailLabel.text = imageName
        
        AF.request(url).responseImage { response  in
            if let image = response.value {
                
                DispatchQueue.main.async {
                    let radius: CGFloat = 15.0
                    self.imageInCell?.image = image.af.imageRounded(withCornerRadius: radius)
                    
                }
            }
        }
    }
}
