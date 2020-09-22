//
//  WindowController.swift
//  Project4
//
//  Created by Timothy Hoiberg on 22/9/20.
//

import Cocoa

class WindowController: NSWindowController {

    @IBOutlet var addressEntry: NSTextField!
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        window?.titleVisibility = .hidden
    }
    
    override func cancelOperation(_ sender: Any?) {
        window?.makeFirstResponder(self.contentViewController)
    }

}
