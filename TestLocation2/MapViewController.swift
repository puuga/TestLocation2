//
//  MapViewController.swift
//  TestLocation2
//
//  Created by Siwawes Wongcharoen on 9/28/2558 BE.
//  Copyright © 2558 puuga. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, GMSMapViewDelegate {
    
    @IBOutlet var vGoogleMap : GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("map hello")
        
        initGoogleMap()
        
    }
    
    func initGoogleMap() {
        vGoogleMap.delegate = self
        vGoogleMap.myLocationEnabled = true
        vGoogleMap.settings.myLocationButton = true
        vGoogleMap.settings.compassButton = true
        vGoogleMap.settings.indoorPicker = true
        
        var camera = GMSCameraPosition.cameraWithLatitude(16, longitude: 100, zoom: 6)
        
        // The myLocation attribute of the mapView may be null
        if let mylocation = vGoogleMap.myLocation {
            let lat = mylocation.coordinate.latitude
            let lng = mylocation.coordinate.longitude
            camera = GMSCameraPosition.cameraWithLatitude(lat, longitude: lng, zoom: 6)
        } else {
//            camera = GMSCameraPosition.cameraWithLatitude(16, longitude: 100, zoom: 6)
        }
        
        vGoogleMap.camera = camera
    }
    
    func mapView(mapView: GMSMapView!, idleAtCameraPosition position: GMSCameraPosition!) {
        vGoogleMap.clear()
        
        
        let coordinate = position.target
        let lat = coordinate.latitude
        let lng = coordinate.longitude
        let marker = GMSMarker(position: coordinate)
        marker.title = "Center Here"
        marker.snippet = "lat: \(lat), lng: \(lng)"
        marker.map = vGoogleMap
    }
    
    func mapView(mapView: GMSMapView!, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
//        let lat = coordinate.latitude
//        let lng = coordinate.longitude
//        print("lat: \(lat), lng: \(lng)")
        makeMarker(coordinate)
    }
    
    func makeMarker(coordinate: CLLocationCoordinate2D) {
        vGoogleMap.clear()
        
        let lat = coordinate.latitude
        let lng = coordinate.longitude
        let marker = GMSMarker(position: coordinate)
        marker.title = "Tab Here"
        marker.snippet = "lat: \(lat), lng: \(lng)"
        marker.map = vGoogleMap
    }
}
