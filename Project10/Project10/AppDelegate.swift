//
//  AppDelegate.swift
//  Project10
//
//  Created by Timothy Hoiberg on 29/9/20.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        statusItem.button?.title = "Fetching..."
        statusItem.menu = NSMenu()
        addConfigurationMenuItem()
        print("meow meow meow")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func addConfigurationMenuItem() {
        let separator = NSMenuItem(title: "Settings", action: #selector(showSettings), keyEquivalent: "")
        statusItem.menu?.addItem(separator)
    }
    
    @objc func showSettings(_ sender: NSMenuItem) {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: "ViewController") as? ViewController else { return }
        
        let popoverView = NSPopover()
        popoverView.contentViewController = vc
        popoverView.behavior = .transient
        popoverView.show(relativeTo: statusItem.button!.bounds, of: statusItem.button!, preferredEdge: .maxY)
    }
}

