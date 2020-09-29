//
//  ViewController.swift
//  Project10
//
//  Created by Timothy Hoiberg on 29/9/20.
//

import Cocoa
import MapKit

class ViewController: NSViewController {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var apiKey: NSTextField!
    @IBOutlet var statusBarOption: NSPopUpButton!
    @IBOutlet var units: NSSegmentedControl!
    @IBOutlet var showPoweredBy: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

