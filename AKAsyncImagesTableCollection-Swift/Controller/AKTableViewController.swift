//
//  AKTableViewController.swift
//  AKAsyncImagesTableCollection
//
//  Created by Arafat on 6/23/15.
//  Copyright (c) 2015 Arafat Khan. All rights reserved.
//

import UIKit

class AKTableViewController: UIViewController {
    
    
    @IBOutlet weak var tblView: UITableView!
    
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return self.imagesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "AKImagesTableViewCell"
        var cell: AKImagesTableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? AKImagesTableViewCell
        if cell == nil {
            cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? AKImagesTableViewCell
        }
        
        /* Place holder image */
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
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        println("Selected Index: \(indexPath.row)")
    }
    
}
