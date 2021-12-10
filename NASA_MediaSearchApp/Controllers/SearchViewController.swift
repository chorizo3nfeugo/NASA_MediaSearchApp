//
//  SearchViewController.swift
//  NASA_MediaSearchApp
//
//  Created by zeus on 2021-12-07.
//  Copyright © 2021 zeus. All rights reserved.
//

import UIKit



class SearchViewController: UIViewController, UISearchResultsUpdating {

    @IBOutlet weak var collectionImageView: UICollectionView!
    
    
    var nasaList = [String: Any]()
    
    let url = "https://images-api.nasa.gov/search?q=mars&media_type=image"
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionImageView.dataSource = self
      

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
        print(text)
        
        NetworkingService.shared.getData {
            print("Got Response")
            }
       }
    
}


extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return nasaList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
      //  cell.setupArrayToCells(with: nasaList[indexPath].row)
        
    return cell
    }
    
    
    
}


