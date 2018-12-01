//
//  CurrentUser.swift
//  Tripy
//
//  Created by Chris  on 11/12/18.
//  Copyright © 2018 Chris . All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class CurrentUser {
    
    var username: String!
    var id: String!
    var readPostIDs: [String]?
//    var trips: [String]?
    
    let dbRef = Database.database().reference()
    
    init() {
        let currentUser = Auth.auth().currentUser
        username = currentUser?.displayName
        id = currentUser?.uid
       
}

 

    
}
