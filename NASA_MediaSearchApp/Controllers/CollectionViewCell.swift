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
        imageDetailLabel.text = nil
        
    }
    
    @IBOutlet weak var imageInCell: UIImageView!
    @IBOutlet weak var imageDetailLabel: UILabel!
    
  //  var selectedItem = NetworkingService.shared.searchedObject
  //  public var selectedItem = SearchViewController.shared.nasaItems

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
    
   func configureCells2(imageName:String, url: String){
        imageDetailLabel.text = imageName
    let downloader = ImageDownloader()
    let urlRequest = URLRequest(url: URL(string: url)!)
    downloader.download(urlRequest) { response in
        debugPrint(response.result)
        if let image = response.value {
            DispatchQueue.main.async {
                              let radius: CGFloat = 15.0
                              self.imageInCell?.image = image.af.imageRounded(withCornerRadius: radius)
                }
            }
        }
    }
    
}
