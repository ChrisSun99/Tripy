//
//  MapViewController.swift
//  Tripy
//
//  Created by Emma Han on 11/12/18.
//  Copyright © 2018 Emma Han. All rights reserved.
//


import UIKit
import GoogleMaps
import Firebase


class MapViewController: UIViewController, GMSMapViewDelegate {
    //create TravelDestinations objects for testing. Will be created when user selects add pin
//    let SanFrancisco = TravelDestinations(name: "San Francisco", location: CLLocationCoordinate2D(latitude: 37.7749300, longitude: -122.4194200), user: users[0])
//    let Pier39 = TravelDestinations(name:"Pier39", location: CLLocationCoordinate2D(latitude: 37.8087, longitude: 122.4098), user: users[1])
//    let goldenGateBridge = TravelDestinations(name:"Golden Gate Bridge", location: CLLocationCoordinate2D(latitude: 37.8199, longitude: 122.4783), user: users[2])
    
    //Temporary: This data should be passed in by segue from ViewPlansViewController
    let selectedDate: [TripModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        
        // Create a GMSCameraPosition that tells the map center at the project distination
        let currentLocation = CLLocationCoordinate2D(latitude: 37.7749300, longitude: -122.4194200)
        let camera = GMSCameraPosition.camera(withTarget: currentLocation, zoom: 11.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.view = mapView
        mapView.delegate = self
        
        
        // for loop to generate the pins
        for pins in selectedDate{
            let marker = GMSMarker()
            marker.position = pins.locationInfo!
            marker.title = pins.name
            marker.map = mapView
            //make pin colors different for each day
            marker.icon = GMSMarker.markerImage(with: .blue)
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        //
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
    }

    func addPins(){
        //add pins with user interaction
    }
    
    func deletePins(){
        //delete pins
    }
    
}


