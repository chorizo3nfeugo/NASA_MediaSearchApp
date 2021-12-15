//
//  RootViewController.swift
//  NASA_MediaSearchApp
//
//  Created by zeus on 2021-12-15.
//  Copyright © 2021 zeus. All rights reserved.
//

import UIKit
import TransitionButton

class RootViewController: UIViewController, UITextFieldDelegate {
    
    let searchBtn = TransitionButton(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    let textField =  UITextField(frame: CGRect(x: 35, y: 335, width: 300, height: 40))
    
    override func viewDidLoad() {
        title = "Search NASA Images!"
        
        textField.placeholder = "Type your search here!"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        textField.isHidden = false
        
        textField.delegate = self
        
        self.view.addSubview(textField)
        
        searchBtn.center = view.center
        searchBtn.backgroundColor = .systemIndigo
        searchBtn.setTitle("Search", for: .normal)
        searchBtn.layer.cornerRadius = 12
        searchBtn.addTarget(self, action: #selector(searchBtnTap), for: .touchUpInside)
        searchBtn.spinnerColor = .systemTeal
        view.addSubview(searchBtn)
        
       
        
    }
    
    
    @objc func searchBtnTap(){
        self.textField.isHidden = true
// MARK: - Pass in textField.text to URL link variable path.
        
//        self.textField.text = NetworkingService.shared.fromUserInputValue
//                NetworkingService.shared.getData {
//                    print("UIText Passed to userInputValue for Network Search")
//                }
        
        searchBtn.startAnimation()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+4) {
            
            
            self.searchBtn.stopAnimation(animationStyle: .expand, revertAfterDelay:1)
            
            let vc = SearchViewController()
            self.present(vc,animated: true)
            
    // See where to put hide text field here before
            //  self.textField.isHidden = false
          
        }
    }
    
}


