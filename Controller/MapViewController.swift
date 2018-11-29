//
//  MapViewController.swift
//  iosFinalProject
//
//  Created by Jiehan Wang on 11/28/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import FirebaseAuth

class MapViewController: UIViewController, GMSMapViewDelegate {

    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 37.871853, longitude: -122.258423, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        mapView.delegate=self
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 37.871853, longitude: -122.258423)
        marker.map = mapView
        marker.title = "Berkeley"
        marker.snippet = "Cal"
        marker.userData = Post.init(id: "first", username: Auth.auth().currentUser?.displayName ?? "default", dateString: "2018-07-22 8:23:28", read: false, name: "test", lat: 37.871853, lon: -122.258423)
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        performSegue(withIdentifier: "details", sender: marker)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            let nextVC =  segue.destination as! SawViewController
            if let marker = sender as? GMSMarker {
                nextVC.post = marker.userData as! Post
            }
        }
    }
}
