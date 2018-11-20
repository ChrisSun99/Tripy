//
//  Itinerary.swift
//  Tripy
//
//  Created by HWKIM on 11/14/18.
//  Copyright © 2018 Chris . All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseStorage
import MapKit

/*
- Itinerary
 - Days
    - Day1
        - LocationInfo
        - User
        - starttime
        - endtime


*/

class TripModel {
    // Name of location
    var name: String
    
    //image
    var image: UIImage?
    // Place
//    var locationInfo: CLLocation
    
    // Start time
    //var starttime: Date
    
    // End time
   // var endtime: Date
    
    // Color of pin
   // var pincolor: String
    
    // User ID
   // var user: String
    
 
    init(name: String,
         image: UIImage? = nil
//         locationInfo: CLLocation,
        // starttime: Date, endtime: Date, pincolor: String, user: String
        ){
        self.name = name
        self.image = image 
//        self.locationInfo = locationInfo
//        self.starttime = starttime
//        self.endtime = endtime
//        self.pincolor = pincolor
//        self.user = user
    }
}
