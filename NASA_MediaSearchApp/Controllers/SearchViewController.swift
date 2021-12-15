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


class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate,UISearchResultsUpdating {
  
    
    @IBOutlet weak var collectionImageView: UICollectionView!

    static let shared = SearchViewController()
    
    var nasaItems = [MediaItem]()
    

    
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
//
//        NetworkingService.shared.getData { response in
//            print(response)
//            self.nasaItems = response.pulledItems
//        collectionImageView.reloadData()
//        }
        
                collectionImageView.dataSource = self
                collectionImageView.delegate = self
                
        
//    collectionImageView.dataSource = self
//    collectionImageView.delegate = self
//    collectionImageView.reloadData()
        self.title = "Search NASA Media"
        
       navigationItem.searchController = searchController
       searchController.searchResultsUpdater = self
        

    }
    
    // MARK: - Search Bar
    let searchController = UISearchController()
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text  else {

            return
        }

   //     NetworkingService.shared.getData2()
        
                NetworkingService.shared.getData { response in
                    print(response)
                    self.nasaItems = response.pulledItems
                }
        print(text)

        collectionImageView.reloadData()

       }
    

  //  public var fromUserInputValue = "Solar Flares"

       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nasaItems.count
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
            
    //        imageSelectedView.imageTiteLbl.text = NetworkingService.shared.searchedObject[indexPath.item].title
    //        imageSelectedView.imageDetailsLbl.text = NetworkingService.shared.searchedObject[indexPath.item].description
            
            self.navigationController?.pushViewController(imageSelectedView, animated: true)
            
            
        }

}





