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
    
    
    
    var nasaList = [String:String]()
    
  //  let url = "https://images-api.nasa.gov/search?q=mars&media_type=image"
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        collectionImageView.dataSource = self
        collectionImageView.delegate = self

            title = "Search NASA Media"
        
        navigationItem.searchController = searchController
        
        searchController.searchResultsUpdater = self
        

//    AF.request("https://images-assets.nasa.gov/image/PIA01124/collection.json").responseJSON { response in
//
//        switch response.result {
//
//        case .success(_):
//            let jsondata = response.value as! [String]?
//            self.nasaList = jsondata!
//
//        case .failure(let error):
//            print("Error Occured \(error)")
//
//        }
//
//        print(self.nasaList)
//    }
        
        
        
        
        
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
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.setupArrayToCells()
        
        
    return cell
   
    }
    
    
    
}


