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
//    var plans = [TripModel]()
    var ref: DatabaseReference!
    var makenewplanviewcontroller = MakePlanViewController()
    
    func viewDidLoad() {
        //set the Firebase reference
       
        ref = Database.database().reference().child("Plans");
        
    }
    
    func createTrip(tripModel: TripModel) {
        Data.tripModels.append(tripModel)


        let existed = ExistedPlansTableViewController()
//        existed.plans.append(TripModel(name: "Trip"))
         existed.mytableView?.reloadData()
        //print(plans[0].name)

        //Post data to database
//        let addtripviewcontroller = AddTripsViewController()
//        ref?.child("Plans").childByAutoId().setValue(["name": addtripviewcontroller.titleLabel.text])
        
        }
    

    func readTrips(completion: @escaping ()-> ()) {
         DispatchQueue.global(qos: .userInitiated).async  {
            if Data.tripModels.count == 0 {
               Data.tripModels = MockData.createMockTripModelData()
            }
            DispatchQueue.main.async {
                completion()
            }
    }
    }
    func readTrip(by id: UUID, completion: @escaping (TripModel?)-> ()) {
    
        DispatchQueue.global(qos: .userInitiated).async  {
            let trip = Data.tripModels.first(where: { $0.id == id})
            
       
        DispatchQueue.main.async {
            completion(trip)
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
