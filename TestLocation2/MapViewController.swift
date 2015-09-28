//
//  MapViewController.swift
//  TestLocation2
//
//  Created by Siwawes Wongcharoen on 9/28/2558 BE.
//  Copyright © 2558 puuga. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    @IBOutlet var vGoogleMap : GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("map hello")
        
        initGoogleMap()
        
    }
    
    func initGoogleMap() {
        
        
        
        vGoogleMap.myLocationEnabled = true
        vGoogleMap.settings.myLocationButton = true
        vGoogleMap.settings.compassButton = true
        
        var camera = GMSCameraPosition.cameraWithLatitude(16, longitude: 100, zoom: 6)
        
        // The myLocation attribute of the mapView may be null
        if let mylocation = vGoogleMap.myLocation {
            let lat = mylocation.coordinate.latitude
            let lng = mylocation.coordinate.longitude
            camera = GMSCameraPosition.cameraWithLatitude(lat, longitude: lng, zoom: 6)
        } else {
            camera = GMSCameraPosition.cameraWithLatitude(16, longitude: 100, zoom: 6)
        }
        
        vGoogleMap.camera = camera
    }
}
