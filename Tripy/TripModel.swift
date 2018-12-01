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
import GoogleMaps



class TripModel {
    // Name of location
    var name: String
    
    //image
    var image: UIImage?
    
    // Place
    var locationInfo: CLLocationCoordinate2D?
    
    let id: UUID!
    var dayModel = [DayModel]()
    // Start time
    //var starttime: Date?
    
    // End time
   // var endtime: Date
    
    // Color of pin
    //var pincolor: String
    
    // User ID
   // var user: String
    
//    var isImportant: Bool
 
    init(name: String,
         image: UIImage? = nil,
         dayModel: [DayModel]? = nil
//         locationInfo: CLLocation, starttime: Date,
//         isImportant: Bool
         //endtime: Date, pincolor: String, user: String
    ){
        id = UUID()
        self.name = name
        self.image = image
        if let dayModel = dayModel{
            self.dayModel = dayModel
        }
       
//        self.locationInfo = locationInfo
//        self.starttime = starttime
//        self.isImportant = false
//        self.endtime = endtime
//        self.pincolor = pincolor
//        self.user = user
    }
}
