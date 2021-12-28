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


class SearchViewController: UIViewController, UICollectionViewDelegate, UISearchBarDelegate {
    
    
    @IBOutlet weak var collectionImageView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    static let shared = SearchViewController()
    public var nasaItems = [MediaItem]()
  
    
// MARK: -                                                                              ViewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        searchBar.delegate = self
        self.title = "Search NASA Media"
        
        collectionImageView.dataSource = self
        collectionImageView.delegate = self
        
    }
    
   
// MARK: -                                                                              SearchBar Clicked Func
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        searchBar.resignFirstResponder()
        
        if let text = searchBar.text {
            
            NetworkingService.shared.getData(query: text) { (mediaItemData) in
                self.nasaItems = mediaItemData
                
                DispatchQueue.main.async {
                    self.collectionImageView.reloadData()
                }
                print("New nasaItems count is \(self.nasaItems.count)")
            }
        }
    }
}



// MARK: -                                                                                 CollectionView Data Sources

extension SearchViewController: UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return nasaItems.count
        
    }
          
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        
        if let imageName = nasaItems[indexPath.item].title, let imageLink = nasaItems[indexPath.item].imageLink {
            
            cell.configureCells(imageName: imageName, url: imageLink)
        }
        
        return cell
        
    }
          
          
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let imageSelectedView:ImageDetailsViewController = self.storyboard?.instantiateViewController(identifier: "showImageDetailsVC") as! ImageDetailsViewController
        
        imageSelectedView.selectedItem = nasaItems[indexPath.item]
        
        print(nasaItems[indexPath.item])
        
        
        self.navigationController?.pushViewController(imageSelectedView, animated: true)
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let position =  collectionView.contentOffset.y
        
        if position > (collectionView.contentSize.height-100-collectionView.frame.size.height){
            
            guard !NetworkingService.shared.isPaginating else {
                print("We are already fetcihging more data! Hold your horses!! ")
                return
            }
            
            print("fetching more Images!")
            
            NetworkingService.shared.fetchMorePages(pagination: true) {  [weak self] results in
                
                
                self?.nasaItems.append(contentsOf: results)
                DispatchQueue.main.async {
                    self?.collectionImageView.reloadData()
                }
                
            }
            
        }
        
    }

}



