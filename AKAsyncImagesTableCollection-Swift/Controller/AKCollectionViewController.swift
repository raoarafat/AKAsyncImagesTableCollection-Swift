//
//  AKCollectionViewController.swift
//  AKAsyncImagesTableCollection
//
//  Created by Arafat on 6/23/15.
//  Copyright (c) 2015 Arafat Khan. All rights reserved.
//

import UIKit



class AKCollectionViewController: UIViewController{
    
    let reuseIdentifier = "ImagesCollectionViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imagesArray : [String] = []
    
    
    // MARK: Controller Initial Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Set array default URL's */
        self.imagesArray = ["http://image.tmdb.org/t/p/w185/6iQ4CMtYorKFfAmXEpAQZMnA0Qe.jpg",
            "http://charcoaldesign.co.uk/AsyncImageView/Forest/IMG_0351.JPG",
            "http://image.tmdb.org/t/p/w185/6iQ4CMtYorKFfAmXEpAQZMnA0Qe.jpg",
            "http://charcoaldesign.co.uk/AsyncImageView/Forest/IMG_0351.JPG",
            "http://image.tmdb.org/t/p/w185/6iQ4CMtYorKFfAmXEpAQZMnA0Qe.jpg",
            "http://charcoaldesign.co.uk/AsyncImageView/Forest/IMG_0351.JPG",
            "http://image.tmdb.org/t/p/w185/6iQ4CMtYorKFfAmXEpAQZMnA0Qe.jpg",
            "http://charcoaldesign.co.uk/AsyncImageView/Forest/IMG_0351.JPG",
            "http://image.tmdb.org/t/p/w185/6iQ4CMtYorKFfAmXEpAQZMnA0Qe.jpg",
            "http://charcoaldesign.co.uk/AsyncImageView/Forest/IMG_0351.JPG",]
        
    }
    
    
    // MARK: - UITableViewDelegate and UITableViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return the number of items in the section
        return imagesArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        // Configure the cell
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)  as! AKImagesCollectionViewCell
        
        cell.imgView?.image = UIImage(named: "Placeholder")
        
        AKClient.sharedInstance().taskForGETImage(self.imagesArray[indexPath.row], completionHandler: { (imageData, error) in
            if let image = UIImage(data: imageData!) {
                dispatch_async(dispatch_get_main_queue()) {
                    cell.imgView!.image = image
                }
            } else {
                println(error)
            }
        })
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100)
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        
        println("Selected Index: \(indexPath.row)")
    }
}
