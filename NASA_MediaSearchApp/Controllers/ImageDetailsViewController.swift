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
        self.title = "Selected Image"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
     //   configImageDetailVC(index: selectedIndex!)
        
    }
    
    var selectedIndex:Int?
    
    @IBOutlet weak var imageTiteLbl: UILabel!
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var imageDetailsLbl: UITextView!
    @IBOutlet weak var dateCreatedLbl: UILabel!
    
    
    func convertDateFormat(inputDate: String) -> String {
        
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

         let oldDate = dateFormatter.date(from: inputDate)

         let convertDateFormatter = DateFormatter()
         convertDateFormatter.dateFormat = "MMM dd yyyy h:mm a"

         return convertDateFormatter.string(from: oldDate!)
    }
  
   


//MARK:  - To Do! : Need to look at function here to find out why finding nil when unwrapping optionals in this function
    
   public func configImageDetailVC(imageTitle: String , imageDetail: String, url: String, imageDate: String) {
    
      
        
        imageTiteLbl.text = imageTitle
         imageDetailsLbl.text = imageDetail
    
        let dateCreated = convertDateFormat(inputDate: imageDate)
        dateCreatedLbl.text = "Image Created on \(dateCreated)"
        
    
       
        
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
