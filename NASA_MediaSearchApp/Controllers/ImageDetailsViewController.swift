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
        
        configImageDetailVC(index: selectedIndex!)
        
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
  
   
// Mark: - Potential Optionals from MediaItemObjects in dateCreated and URL here
   
    func configImageDetailVC(index: Int){
    
        let selectedItem = NetworkingService.shared.parsedMediaObjects
        let dateCreated = convertDateFormat(inputDate: selectedItem[index].dateCreated)
        
        dateCreatedLbl.text = "Image Created on \(dateCreated)"
        imageTiteLbl.text = selectedItem[index].title
        imageDetailsLbl.text = selectedItem[index].description
       
        
        let url = "\(selectedItem[index].imageLink)"
          
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
