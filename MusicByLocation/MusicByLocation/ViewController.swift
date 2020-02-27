//
//  ViewController.swift
//  MusicByLocation
//
//  Created by Ahmed, Maheraj (HWTA) on 27/02/2020.
//  Copyright © 2020 Ahmed, Maheraj (HWTA). All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet var musicRecommendations: UILabel!
    
    let locationManager = CLLocationManager()
    let geoCoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }
    
    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geoCoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in if error != nil {
                
                self.musicRecommendations.text = "Could not perform lookup of location for latitude: \(firstLocation.coordinate.latitude.description)"
            } else {
                let locality = placemarks?[0].locality
                let subLocality = placemarks?[0].subLocality
                let timeZone = placemarks?[0].timeZone
                let thoroughfare = placemarks?[0].thoroughfare
                self.musicRecommendations.text = "You are in \(subLocality!),\(locality!). The time zone of this city is \(timeZone!). The street of your location is \(thoroughfare!)."
                }
            })
            musicRecommendations.text = firstLocation.coordinate.latitude.description
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not access user location. Error:\(error.localizedDescription)"
    }

}

