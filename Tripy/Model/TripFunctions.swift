//
//  TripModel.swift
//  Tripy
//
//  Created by Chris  on 11/19/18.
//  Copyright © 2018 Chris . All rights reserved.
//

import Foundation
import UIKit
import Firebase


class TripFunctions {
    
    var ref: DatabaseReference!
    var makenewplanviewcontroller = MakePlanViewController()
    
    func viewDidLoad() {
        //set the Firebase reference
       
        ref = Database.database().reference().child("Plans");
        
    }
    
    func createTrip(tripModel: TripModel) {
        //Data.tripModels.append(tripModel)
        
        //Post data to database
        let addtripviewcontroller = AddTripsViewController()
        ref?.child("Plans").childByAutoId().setValue(["name": addtripviewcontroller.titleLabel.text])
        
        }
    

    func readTrips(completion: @escaping ()-> ()) {
    DispatchQueue.global(qos: .userInitiated).async  {
        if Data.tripModels.count == 0{
            
            // add a trip here 
           
            
        }
        DispatchQueue.main.async {
            completion()
        }
    }
    
}
    
   
    
    func updateTrip(at index: Int, title:String, image: UIImage? = nil){
//        Data.tripModels[index].name = title
//        Data.tripModels[index].image = image
        
        
        //ref?.child("Plans").childByAutoId().setValue(["name": username])
}
    static func deleteTrip(index: Int) {
        Data.tripModels.remove(at: index)
    }
}
