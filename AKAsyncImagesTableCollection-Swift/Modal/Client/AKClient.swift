//
//  AKClient.swift
//  AKAsyncImagesTableCollection
//
//  Created by Arafat on 6/23/15.
//  Copyright (c) 2015 Arafat Khan. All rights reserved.
//

import UIKit
import Foundation

class AKClient: NSObject {
    
    /* Shared session */
    var session: NSURLSession
    
    
    override init() {
        session = NSURLSession.sharedSession()
        super.init()
    }
    
    // MARK: - Shared Instance
    
    class func sharedInstance() -> AKClient {
        
        struct Singleton {
            static var sharedInstance = AKClient()
        }
        
        return Singleton.sharedInstance
    }
    
    // MARK: - GET
    
    func taskForGETImage(url: String, completionHandler: (imageData: NSData?, error: NSError?) ->  Void) {
        
        /* 1. Set the parameters */
        // There are none...
        
        /* 2/3. Build the URL and configure the request */
        let baseURL = NSURL(string: url)!
        let request = NSURLRequest(URL: baseURL)
        
        /* 4. Make the request */
        let task = session.dataTaskWithRequest(request) {data, response, downloadError in
            
            /* 5/6. Parse the data and use the data (happens in completion handler) */
            if let error = downloadError {
                completionHandler(imageData: nil, error: downloadError)
            } else {
                completionHandler(imageData: data, error: nil)
            }
        }
        
        /* 7. Start the request */
        task.resume()
        
    }
    
}
