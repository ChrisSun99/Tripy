//
//  DayModel.swift
//  Tripy
//
//  Created by Chris  on 11/28/18.
//  Copyright © 2018 Chris . All rights reserved.
//

import Foundation
class DayModel {
    var id: String!
    //var pin = [Pin]()
    var date: String!
    
    
    init(date: String!
         //data:[Pin]?
        ){
        id = UUID().uuidString
 //       if let data = data {
  //          self.pin = data
            self.date = date
 //       }
    }
}
