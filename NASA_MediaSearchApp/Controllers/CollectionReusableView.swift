//
//  FooterCollectionReusableView.swift
//  NASA_MediaSearchApp
//
//  Created by zeus on 2021-12-26.
//  Copyright © 2021 zeus. All rights reserved.
//

import UIKit

class FooterCollectionReusableView: UICollectionReusableView {
   
    static let identifier = "FooterCollectionViewReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder:NSCoder){
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
 
    
  
    
    
}

class HeaderCollectionReusableView: UICollectionReusableView {
   
    static let identifier = "HeaderCollectionViewReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder:NSCoder){
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
