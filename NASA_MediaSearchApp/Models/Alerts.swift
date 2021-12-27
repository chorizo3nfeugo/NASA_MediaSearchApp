//
//  Alerts.swift
//  NASA_MediaSearchApp
//
//  Created by zeus on 2021-12-26.
//  Copyright © 2021 zeus. All rights reserved.
//

import UIKit

final class Alert {
 
    class func showBasic(title: String, message:String, vc: UIViewController){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
    
}
