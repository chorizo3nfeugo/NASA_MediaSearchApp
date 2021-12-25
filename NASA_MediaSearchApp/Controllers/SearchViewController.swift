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
    //    self.collectionImageView.reloadData()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        
        searchBar.resignFirstResponder()
        
       
        if let text = searchBar.text {
            
            NetworkingService.shared.getData(query: text) { (mediaItemData) in
                self.nasaItems = mediaItemData
                
                 DispatchQueue.main.async {
                self.collectionImageView.reloadData()
                }
                print("Here are items stored in nasaItems! =   \(self.nasaItems)")
                
                print("After nasaItems assigned! count is \(mediaItemData.count)")
                
              
            }
            print("Nasa items count is still \(self.nasaItems.count)")
    
        }

    }
    
}


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
              
// assign nasaItem to selectedImage
            
            imageSelectedView.selectedItem = nasaItems[indexPath.item]
            
            print(nasaItems[indexPath.item])
         
            
              self.navigationController?.pushViewController(imageSelectedView, animated: true)
              
              
          }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
      
        if indexPath.row == nasaItems.count - 1    {  //numberofitem count
            
                print("Will go fetch more data here!!")

            guard !NetworkingService.shared.isPaginating else {
                print("We are already fetcihging more data!")
                    return
            }

                   NetworkingService.shared.fetchMorePages(pagination: true) { [weak self] results in
                                     
                                 self?.nasaItems.append(contentsOf: results)
                                 DispatchQueue.main.async {
                                     self?.collectionImageView.reloadData()
                                     }
                                     
                                     }
                }
        print("You are scrollling near \(nasaItems[indexPath.row].title!)")
         
    }

    
 
 
//    private func createSpinnerFooter() -> UIView {
//        let footerView = UIView(fre)
//    }
   
    
}



