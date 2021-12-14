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
    
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkingService.shared.getData {
            collectionImageView.reloadData()
                    }
        
        collectionImageView.dataSource = self
        collectionImageView.delegate = self

            title = "Search NASA Media"
        
        navigationItem.searchController = searchController
        
        searchController.searchResultsUpdater = self
        

    }
    
    
    
// MARK: - Search Bar
let searchController = UISearchController()
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text  else {
    
            return
        }
        
//MARK: - TO DO! : Implement Search bar to link search translation!
        
        print(text)
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


