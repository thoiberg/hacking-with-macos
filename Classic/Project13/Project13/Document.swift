//
//  Document.swift
//  Project13
//
//  Created by Timothy Hoiberg on 25/12/20.
//

import Cocoa

enum ScreenshotError: Error {
    case BadData
}

class Document: NSDocument {
    var screenshot = Screenshot()
    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        return try NSKeyedArchiver.archivedData(withRootObject: screenshot, requiringSecureCoding: false)
        // Insert code here to write your document to data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override fileWrapper(ofType:), write(to:ofType:), or write(to:ofType:for:originalContentsURL:) instead.
    }

    override func read(from data: Data, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override read(from:ofType:) instead.
        // If you do, you should also override isEntireFileLoaded to return false if the contents are lazily loaded.
        if let loadedScreenshot = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Screenshot {
            screenshot = loadedScreenshot
        } else {
            throw ScreenshotError.BadData
        }
    }


}

