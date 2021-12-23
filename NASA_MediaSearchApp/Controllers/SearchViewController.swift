//
//  SearchViewController.swift
//  NASA_MediaSearchApp
//
//  Created by zeus on 2021-12-07.
//  Copyright © 2021 zeus. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import TransitionButton


class SearchViewController: UIViewController, UICollectionViewDelegate, UISearchBarDelegate {
    
    
  
    
    @IBOutlet weak var collectionImageView: UICollectionView!
    

    
    @IBOutlet weak var searchBar: UISearchBar!
    

    static let shared = SearchViewController()
   

 
    public var nasaItems = [MediaItem]()

    
// MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        searchBar.delegate = self
        self.title = "Search NASA Media"
  

                collectionImageView.dataSource = self
                collectionImageView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionImageView.reloadData()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        
        searchBar.resignFirstResponder()
        
       
        if let text = searchBar.text {
          
           NetworkingService.shared.getData(query: text)
            
            
           
        }
        
                viewDidLoad()
                viewWillAppear(true)
        print(NetworkingService.shared.parsedMediaObjects.count)
        
    }
  
    
    
}


extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NetworkingService.shared.parsedMediaObjects.count
    }
          
          func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "CollectionViewCell", for: indexPath) as! CollectionViewCell
              
              cell.configureCells(index: indexPath.item)
              
          return cell
         
          }
          
          
          func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
              print("User tapped on image!")
              
              let imageSelectedView:ImageDetailsViewController = self.storyboard?.instantiateViewController(identifier: "showImageDetailsVC") as! ImageDetailsViewController
              
              imageSelectedView.selectedIndex = indexPath.item
              
   
              self.navigationController?.pushViewController(imageSelectedView, animated: true)
              
              
          }
    
}



