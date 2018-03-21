//
//  ViewController.swift
//  arTest
//
//  Created by Mateusz Chojnacki on 07.03.2018.
//  Copyright © 2018 Mateusz Chojnacki. All rights reserved.
//

import UIKit
import ARKit

import SceneKit
import CoreLocation
class ViewController: UIViewController, ARSCNViewDelegate, CLLocationManagerDelegate,ARLocationDelegae {
    @IBOutlet weak var outletBTN: UIButton!
    
    func addChildNode(modelNode: SCNNode!) {
        self.arView.scene.rootNode.addChildNode(modelNode)
    }
    

    @IBOutlet weak var arView: ARSCNView!
    let locationManager = CLLocationManager()
    var userLocation = CLLocation()
    var arLocationManager = ARLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.arLocationManager.delegate = self;
         self.arView.delegate = self
        let scene = SCNScene()
        
        // Set the scene to the view
        self.arView.scene = scene
        
        // Start location services
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        
        if userLocation.coordinate.latitude != 0{

 
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.worldAlignment = .gravityAndHeading
        
        // Run the view's session
        self.arView.session.run(configuration)
    }


    // Location
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            self.locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            userLocation = location
            outletBTN.titleLabel?.text = ("\(location.coordinate.latitude),\(location.coordinate.longitude)")
        
        }
    }
    

    
    
    
    @IBAction func addPinBTN(_ sender: Any) {
//        // agraf B
//        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.759398, 19.448909))
//        // agraf A
//        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.759284, 19.449472))
//        // palarnia
//        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.759550, 19.449398))
//        // agraf c
        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.757641, 19.449108))
        
    }
    
    
    
    
}

