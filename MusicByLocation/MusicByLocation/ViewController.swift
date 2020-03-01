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
        getArtists()
    }
    
    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geoCoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in if error != nil {
                self.musicRecommendations.text = "Could not perform lookup of location for latitude: \(firstLocation.coordinate.latitude.description)"
            } else {
                if let firstPlacemark = placemarks?[0] {
                    self.musicRecommendations.text = self.getArtists()
                    let locationBreakdown = self.getLocationBreakdown(placemark: firstPlacemark)
                    
                }
                }
            })
            musicRecommendations.text = firstLocation.coordinate.latitude.description
        }
    }
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not access user location. Error:\(error.localizedDescription)"
    }
    
    func getLocationBreakdown(placemark: CLPlacemark) -> String {
        return
            """
            Street: \(placemark.thoroughfare ?? "None")
            Area: \(placemark.administrativeArea ?? "None")
            Country: \(placemark.country ?? "None")
            """
    }
    
    func getArtists() -> String {
    
        guard let url = URL(string: "https://itunes.apple.com/search?term=Lionel%20Richie&entity=musicArtist")
            else {
                print("Invalid URL.")
                return "Invalid URL. Wasn't able to search ITunes"
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    let names = response.results.map {
                        return $0.artistName
                    }
    
                    DispatchQueue.main.async {
                        self.musicRecommendations.text = names.joined (separator: ", ")
                    }
                    
                }
            }
        }.resume()
        
        return ""
    }
    
    func parseJson(json: Data) -> ArtistResponse? {
        
        
        let decoder = JSONDecoder()
        
        if let artistRespose = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistRespose
        } else {
            print("Failed to decode to Artist Response")
            return nil
        }
    }

}

