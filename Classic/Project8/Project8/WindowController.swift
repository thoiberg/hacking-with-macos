//
//  WindowController.swift
//  Project8
//
//  Created by Timothy Hoiberg on 26/9/20.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        window?.styleMask = [window!.styleMask, .fullSizeContentView]
        window?.titlebarAppearsTransparent = true
        window?.titleVisibility = .hidden
        window?.isMovableByWindowBackground = true
        
        window?.backgroundColor = NSColor.clear
    }

}
