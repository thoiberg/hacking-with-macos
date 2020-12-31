//
//  StarFormatter.swift
//  Project16
//
//  Created by Timothy Hoiberg on 31/12/20.
//

import Cocoa

class StarFormatter: Formatter {
    override func string(for obj: Any?) -> String? {
        if let obj = obj {
            if let number = Int(String(describing: obj)) {
                return String(repeating: "🌟", count: number)
            }
        }
        
        return ""
    }
}
