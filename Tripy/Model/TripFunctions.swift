//
//  TripModel.swift
//  Tripy
//
//  Created by Chris  on 11/19/18.
//  Copyright © 2018 Chris . All rights reserved.
//

import Foundation
import UIKit

class TripFunctions {
    static func createTrip(tripModel: TripModel) {
        Data.tripModels.append(tripModel)
  
    }
    
    static func readTrips(completion: @escaping ()-> ()) {
    DispatchQueue.global(qos: .userInitiated).async  {
        if Data.tripModels.count == 0{
            
            // add a trip here 
           
            
        }
        DispatchQueue.main.async {
            completion()
        }
    }
    
}
    static func updateTrip(at index: Int, title:String, image: UIImage? = nil){
        Data.tripModels[index].name = title
        Data.tripModels[index].image = image
}
    static func deleteTrip(index: Int) {
        Data.tripModels.remove(at: index)
    }
}
