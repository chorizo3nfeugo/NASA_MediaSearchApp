//
//  ImageDetailsViewController.swift
//  NASA_MediaSearchApp
//
//  Created by zeus on 2021-12-14.
//  Copyright © 2021 zeus. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ImageDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configImageDetailVC(index: selectedIndex!)
        
    }
    
    var selectedIndex:Int?
    
    @IBOutlet weak var imageTiteLbl: UILabel!
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var imageDetailsLbl: UITextView!
    @IBOutlet weak var dateCreatedLbl: UILabel!
    
    
    func dateStringConvert(date: Date) -> String {
        return("")
    }
    
    
    func configImageDetailVC(index: Int){
    
        let selectedItem = NetworkingService.shared.searchedObject
        
        imageTiteLbl.text = selectedItem[index].title
        imageDetailsLbl.text = selectedItem[index].description
        dateCreatedLbl.text = selectedItem[index].dateCreated
        
        let url = "\(NetworkingService.shared.searchedObject[index].imageLink)"
          
           AF.request(url).responseImage { response  in
               if let image = response.value {
                   
                   DispatchQueue.main.async {
                       let radius: CGFloat = 15.0
                    self.selectedImageView.image = image.af.imageRounded(withCornerRadius: radius)
                       
                   }
               }
           }
       }
    
}
