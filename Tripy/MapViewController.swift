//
//  MapViewController.swift
//  Tripy
//
//  Created by Emma Han on 11/12/18.
//  Copyright © 2018 Emma Han. All rights reserved.
//


import UIKit
import GoogleMaps
import GooglePlaces
import Firebase

struct Places {
    let name: String
    let lat: CLLocationDegrees
    let long: CLLocationDegrees

}

class MapViewController: UIViewController, GMSMapViewDelegate {
    //    create TravelDestinations objects for testing. Will be created when user selects add pin
    let places: [Places] = [Places(name: "San Francisco",lat: 37.7749300, long: -122.4194200), Places(name: "Pier 39", lat: 37.8087, long: -122.4098), Places(name: "Golden Gate Bridge", lat:37.8199, long: -122.4783)]
    
    let SFO: Places = Places(name: "SFO", lat: 37.773972, long: -122.431297)
    
    @IBAction func goBack(_ sender: Any) {
        performSegue(withIdentifier: "toExistedPlans", sender: self)
    }
    //Temporary: This data should be passed in by segue from ViewPlansViewController
    
    var myView: GMSMapView?
    //keep track of all the loaded markers
    var markers: [String: GMSMarker] = [:]
    /* Initial location of the map */
    var travelPlace: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.7749300, longitude:-122.4194200)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentLocation = travelPlace
        let camera = GMSCameraPosition.camera(withTarget: currentLocation, zoom: 11.0)
        let screenSize = UIScreen.main.bounds
        let mapView = GMSMapView.map(withFrame: CGRect(x:0, y:80, width: screenSize.width, height:screenSize.height - 80), camera: camera)
        self.view.addSubview(mapView)
        
        
        
        
        myView = mapView
        mapView.delegate = self
        myView!.settings.myLocationButton = true
        
        loadPins()
        
        let marker2 = GMSMarker(position: CLLocationCoordinate2D(latitude: SFO.lat, longitude: SFO.long))
        marker2.title = SFO.name
        marker2.map = myView
        marker2.icon = GMSMarker.markerImage(with: .red)
        
    }
    
//    override func loadView() {
//
//        // Create a GMSCameraPosition that tells the map center at the project distination
//
//    }
//
    func loadPins() {
        for pin in places {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: pin.lat, longitude: pin.long)
            marker.title = pin.name
            marker.map = myView
            marker.icon = GMSMarker.markerImage(with: .blue)
            markers[pin.name] = marker
            marker.isDraggable=true
        }
        
    }
    /* presents simple info with a tap */
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        let lat = coordinate.latitude
        let long = coordinate.longitude
        print("You tapped at \(lat), \(long)")
    }
    
    /* handles Info Window long press */
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        
        print("didLongPressInfoWindowOf")
    }
    
    func addPins(name: String, marker: GMSMarker){
    
        //add pins with user interaction
    }
    
    func deletePins(){
        
    }
    
    func clearMap() {
        myView!.clear()
    }
    
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 70))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        
        let lbl1 = UILabel(frame: CGRect.init(x: 8, y: 8, width: view.frame.size.width - 16, height: 17))
        lbl1.text = marker.title
        view.addSubview(lbl1)
        
        let lbl2 = UILabel(frame: CGRect.init(x: lbl1.frame.origin.x, y: lbl1.frame.origin.y + lbl1.frame.size.height + 3, width: view.frame.size.width - 16, height: 13))
        lbl2.text = "Trip to San Francisco"
        lbl2.font = UIFont.systemFont(ofSize: 14, weight: .light)
        view.addSubview(lbl2)
        
        return view
    }
    
    
    
}

