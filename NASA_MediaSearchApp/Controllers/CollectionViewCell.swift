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
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageInCell.image = nil
    }
    
    @IBOutlet weak var imageInCell: UIImageView!
    
    
    @IBOutlet weak var imageDetailLabel: UILabel!
    
  //  var selectedItem = NetworkingService.shared.searchedObject
    var selectedItem = NetworkingService.shared.parsedMediaObjects

    func configureCells(index: Int){
        
        imageDetailLabel.text = selectedItem[index].title
        
        let url = "\(selectedItem[index].imageLink)"
       
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
