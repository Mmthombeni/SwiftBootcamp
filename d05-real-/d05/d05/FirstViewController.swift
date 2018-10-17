//
//  FirstViewController.swift
//  d05
//
//  Created by Malebo MTHOMBENI on 2018/10/08.
//  Copyright © 2018 Malebo MTHOMBENI. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var deviceLoc: CLLocationCoordinate2D? = nil
    var authStatus = CLAuthorizationStatus.denied
    
    @IBOutlet weak var viewMapType: UISegmentedControl!
    
    
    @IBAction func findLoction(_ sender: UIButton) {
        if authStatus != CLAuthorizationStatus.denied {
            if (deviceLoc != nil){
                mapView.setRegion(MKCoordinateRegionMakeWithDistance(deviceLoc! , 200, 200), animated: true)
                //mapView.setCenter(deviceLoc!, animated: true)
                mapView.showsUserLocation = true
            }else{
                print("err...!")
            }
        }
    }
    
    func go(position: CLLocationCoordinate2D){
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(position, 200, 200), animated: true)
        //mapView.setCenter(position, animated: true)
        print("in")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fourtyTwo = MKPointAnnotation()
        fourtyTwo.title = "42"
        fourtyTwo.subtitle = "Mother of WTC"
        fourtyTwo.coordinate = CLLocationCoordinate2D(latitude: 48.896601, longitude: 2.318501)
        
        for places in placeData.placeList {
            let pin = MKPointAnnotation()
            pin.title = places.0
            pin.subtitle = places.1
            pin.coordinate = places.2
            mapView.addAnnotation(pin)
        }
        
        mapView.addAnnotation(fourtyTwo)
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(fourtyTwo.coordinate , 200, 200), animated: true)
        mapView.setCenter(fourtyTwo.coordinate, animated: true)
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
//        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func mapTypeFunc(_ sender: UISegmentedControl) {
        let getIndex = viewMapType.selectedSegmentIndex
        
        switch (getIndex) {
        case 0:
            self.mapView.mapType = .standard
        case 1:
            self.mapView.mapType = .satellite
        case 2:
            self.mapView.mapType = .hybrid
        default:
            print("no selection")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.first {
            deviceLoc = loc.coordinate
            print("Location updated: ", loc.coordinate)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        authStatus = status
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else {return nil}
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        return annotationView
    }

}

