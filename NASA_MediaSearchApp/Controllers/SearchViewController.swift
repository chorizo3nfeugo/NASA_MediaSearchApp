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



class SearchViewController: UIViewController, UISearchResultsUpdating, UICollectionViewDelegate {

    @IBOutlet weak var collectionImageView: UICollectionView!

    
    static let shared = SearchViewController()
    

    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
 // ===============
        NetworkingService.shared.getData {
        
            print("Get data! Via viewDownload!")
                    }
        
        collectionImageView.dataSource = self
        collectionImageView.delegate = self

        self.title = "Search NASA Media"
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        

    }
    

    public var fromUserInputValue = "Nova"

    
// MARK: - Search Bar
let searchController = UISearchController()
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text  else {
        
            return
        }
        
//MARK: - TO DO! : Implement Search bar to link search translation!
        
        fromUserInputValue = text
        print(text)
        
      //   NetworkingService.shared.getData()
        collectionImageView.reloadData()

       }
    
}




extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NetworkingService.shared.searchedObject.count 
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



