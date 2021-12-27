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
                
        configureImageDetails(mediaItem: selectedItem)
        
    }
    
    
   

    public var selectedItem = MediaItem(title: "Title", description: "Description", imageLink: "htps://", dateCreated: "Date!")
    
    
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
  
    
    
//MARK:  -              Configs slected image into View
    
     func configureImageDetails(mediaItem: MediaItem) {
       
        imageTiteLbl.text = mediaItem.title
        let imageDate = convertDateFormat(inputDate: mediaItem.dateCreated!)
        imageDetailsLbl.text = mediaItem.description
        dateCreatedLbl.text = imageDate

        AF.request(mediaItem.imageLink!).responseImage { response  in
           
            if let image = response.value {
                DispatchQueue.main.async {
                    let radius: CGFloat = 15.0
                 self.selectedImageView.image = image.af.imageRounded(withCornerRadius: radius)

                }
            }
            
        }
    }
    
 
    
}
