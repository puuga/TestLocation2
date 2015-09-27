//
//  ViewController.swift
//  TestLocation2
//
//  Created by Siwawes Wongcharoen on 9/27/2558 BE.
//  Copyright © 2558 puuga. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var lbLat : UILabel!
    @IBOutlet var lbLng : UILabel!
    @IBOutlet var lbAcc : UILabel!
    
    var locationManager:CLLocationManager!
    var seenError : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        initLocationManager()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        locationManager.stopUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initLocationManager() {
        seenError = false
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        print("lat: \(newLocation.coordinate.latitude)")
        print("lng: \(newLocation.coordinate.longitude)")
        print("acc: \(newLocation.horizontalAccuracy)")
        
        lbLat.text = "\(newLocation.coordinate.latitude)"
        lbLng.text = "\(newLocation.coordinate.longitude)"
        lbAcc.text = "\(newLocation.horizontalAccuracy)"
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        locationManager.stopUpdatingLocation()
        seenError = true
        print(error)
    }
    
    func locationManager(manager: CLLocationManager,
        didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            var shouldIAllow = false
            var locationStatus = ""
            
            switch status {
                case CLAuthorizationStatus.Restricted:
                    locationStatus = "Restricted Access to location"
                case CLAuthorizationStatus.Denied:
                    locationStatus = "User denied access to location"
                case CLAuthorizationStatus.NotDetermined:
                    locationStatus = "Status not determined"
                default:
                    locationStatus = "Allowed to location Access"
                    shouldIAllow = true
            }
            NSNotificationCenter.defaultCenter().postNotificationName("LabelHasbeenUpdated", object: nil)
            if (shouldIAllow == true) {
                print("Location to Allowed")
                // Start location services
                locationManager.startUpdatingLocation()
            } else {
                print("Denied access: \(locationStatus)")
            }
    }

}

