//
//  FacebookAuth.swift
//  DecHex
//
//  Created by Toby Applegate on 24/11/2015.
//  Copyright © 2015 Toby Applegate. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreData

class FacebookData {

    func returnUserData()
    {
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "name, email, friends, likes, picture.type(large)"])
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error    :   \(error)")
                
            }
            else
            {
                let json = JSON(result)
                
//                //get fb user name
//                let name = json["name"].stringValue
//                print("the JSON name is: \(name)")
//                
//                //get fb email address
//                let email = json["email"].stringValue
//                print("the JSON email is: \(email)")
//                
//                //get fb friends total count
//                let friends = json["friends"]["summary"]["total_count"].stringValue
//                print("the JSON friends is: \(friends)")
//                
//                //get fb pages liked
//                let likes = json["likes"]["data"]
//                print("\(likes)")
                
                let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
                let fbDataStore = NSEntityDescription.insertNewObjectForEntityForName("FbData", inManagedObjectContext: managedObjectContext) as! FbData

                
                //Populate core data with fb pages liked
                for (key, subJson) in json["likes"]["data"] {
                    if let pageName = subJson["name"].string {
                        if let pageLiked = subJson["created_time"].string {
                            fbDataStore.pageLiked = pageName
                            fbDataStore.likeDate = pageLiked
                            
                            //print("name of page:  \(pageName)")
                            //print("date joined :  \(pageLiked)")
                        }
                    }
                }
            }
        })
    }
    
    func getProfilePicture() -> NSData?{
        var response:NSData?
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"picture.type(large)"])
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if error != nil {
                print("login error: \(error!.localizedDescription)")
                return
            }
            
            let json = JSON(result)
            let profilePicture = json["picture"]["data"]["url"].stringValue
            
            if let url = NSURL(string: profilePicture) {
                if let pictureData = NSData(contentsOfURL: url){
                    print("OGT DATATATATAAT")
                    response = pictureData
                    //print(response)
                }
            }
            
        })
        //print(response)
        return response
    }
}