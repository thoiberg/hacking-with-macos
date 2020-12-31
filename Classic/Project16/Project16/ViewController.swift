//
//  ViewController.swift
//  Project16
//
//  Created by Timothy Hoiberg on 31/12/20.
//

import Cocoa

class ViewController: NSViewController {
    @objc dynamic var reviews = [Review]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

