//
//  MockData.swift
//  Tripy
//
//  Created by Chris  on 11/28/18.
//  Copyright © 2018 Chris . All rights reserved.
//

import Foundation

class MockData {
    static func createMockTripModelData() -> [TripModel]{
        var mockTrips = [TripModel]()
        mockTrips.append(TripModel(name: "Brazil", image: #imageLiteral(resourceName: "rio")))
        mockTrips.append(TripModel(name: "San Francisco", image: #imageLiteral(resourceName: "san francisco")))
        mockTrips.append(TripModel(name: "Berkeley", image: #imageLiteral(resourceName: "yosemite")))
        return mockTrips
    }
    
    static func createMockDayModelData() -> [DayModel]{
        var dayModal  = [DayModel]()
        dayModal.append(DayModel(date: "Nov 28"))
         dayModal.append(DayModel(date: "Nov 29"))
        return dayModal
    }
}
