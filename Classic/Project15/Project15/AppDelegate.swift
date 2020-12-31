//
//  AppDelegate.swift
//  Project15
//
//  Created by Timothy Hoiberg on 31/12/20.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        NSColorPanel.shared.showsAlpha = true
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

